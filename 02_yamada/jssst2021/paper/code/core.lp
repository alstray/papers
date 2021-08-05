#script (python) 
import clingo

def get(val, default):
    return val if val != None else default

def main(prg):
    core_stop  = get(prg.get_const("core_stop"), clingo.String("SAT"))
    core_max   = prg.get_const("core_max")

    step, ret = 0, None
    while ((core_max is None or step <= core_max.number) and
            (step == 0 or (core_stop.string == "SAT" and not ret.satisfiable) or
            (core_stop.string == "UNSAT" and not ret.unsatisfiable))):    
        parts = []
        parts.append(("check", [step]))
        parts.append(("step", [step]))
        if step > 0:
            prg.release_external(clingo.Function("query", [step-1]))
            prg.cleanup()
        else:
            parts.append(("base", []))
        prg.ground(parts)
        prg.assign_external(clingo.Function("query", [step]), True)
        ret, step = prg.solve(), step+1

    print('c step: %s' % str(step-1))
    if (step != 0 and
        (core_stop.string != "SAT" or ret.satisfiable) and
        (core_stop.string != "UNSAT" or ret.unsatisfiable)):
        print('s REACHABLE')
    else:
        print('s UNREACHABLE')

#end.
#program check(t).
#external query(t).