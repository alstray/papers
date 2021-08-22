parts = []
parts.append(("check", [step]))
parts.append(("step", [step]))
if step > 0:
    prg.release_external(clingo.Function
        ("query", [step-1]))
    prg.cleanup()
else:
    parts.append(("base", []))
prg.ground(parts)
prg.assign_external(clingo.Function
    ("query", [step]), True)
ret, step = prg.solve(), step+1