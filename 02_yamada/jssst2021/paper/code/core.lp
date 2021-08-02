#script (python) 
import clingo

def get(val, default):
    return val if val != None else default

def main(prg):
    step, ret = 0, None
    while ((core_max is None or step <= core_max.number) and
            (step == 0 or step < core_min.number or
            (core_stop.string == "SAT" and not ret.satisfiable) or
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
        
#end.

#program check(t).
#external query(t).
