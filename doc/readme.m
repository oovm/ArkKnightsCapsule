get6[n_] := Which[0 <= n <= 50, 2 / 100, n <= 99, 2(n - 49) / 100, True, 0];
sum6[n_] := sum6[n] = get6[n] * Product[1 - get6[i], {i, 1, n - 1}];
Sum[i * sum6[i], {i, 1, 99}] // N