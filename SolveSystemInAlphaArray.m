function SolveSystemInAlphaArray(system, alpha_array)
    sym x1 
    sym x2 
    sym alpha
    if nargin<2 || numel(alpha_array) == 0
        % sistema con le variabili x_1, x_2
        [sol_n1_x, sol_n1_y] = solve(system, x1, x2);
    else
        % sistema con le variabili x_1, x_2, alpha ed alpha_array non vuoto
        for i = 1:numel(alpha_array)
            alpha_value = alpha_array(i)
            fprintf('\n\nCaso alpha = %s\n', alpha_value)
            system_eval = subs(system, alpha, alpha)
            [x_es, y_es] = solve(system_eval, x1, x2);
            for j = 1:numel(x_es)
                x = sol_0_x(i);
                y = sol_0_y(i);
                fprintf('Soluzione (%4s, %4s)\n', x, y);
            end
        end
    end
end