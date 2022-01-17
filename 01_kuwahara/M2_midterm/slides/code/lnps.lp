def main(prg):
    prg.ground([('reuse', [])])
    get_lnps_config(prg)

    prg.ground([('base', [])])
    if legacy_flag:
        prg.assign_external(clingo.Function('initial_solution'), True)
    solver = Solver(prg)

    sol, cost = solver.run(init_option)
    sol_best, cost_best = sol, cost

    if legacy_flag:
        prg.release_external(clingo.Function('initial_solution'))
        solver.finished = False

    heu_atoms = []
    prev_heu_atoms = []
    t = 0

    h = ''
    for c in lnps_config:
        a = c['atom_name'].name + '(' + ','.join(['X'+str(i) for i in range(c['args_num'].number)]) + ')'
        h += '#heuristic {0} : heuristic({0},W,M,t). [W,M]'.format(a)
    prg.add('heuristic', ['t'], h)

    while not solver.finished:
        t += 1

        for i in range(len(lnps_config)):
            targets = destroy(sol, lnps_config[i])
            atoms = prioritize(targets, lnps_config[i], t)
            heu_atoms.extend(atoms)

        for a in prev_heu_atoms:
            prg.release_external(a)
		
        s = ''
        for a in heu_atoms:
            s += '#external {0}.'.format(a)
        prg.add('external', ['t'], s)
        prg.ground([('external', [t])])
        prg.ground([('heuristic', [t])])
	
        for a in heu_atoms:
            prg.assign_external(a, True)
        prev_heu_atoms = copy.copy(heu_atoms)
        heu_atoms.clear()
	
        sol_tmp, cost_tmp = solver.run(iter_option)
        if cost_tmp < cost:
            sol, cost = sol_tmp, cost_tmp
        if cost_tmp < cost_best:
            sol_best, cost_best = sol_tmp, cost_tmp

    print('Best Optimization: {0}'.format(cost_best))
    print("Total Iteration: {0}".format(t))
    print('Answer:')
    print(sol_best)
    print("\n")

#end.