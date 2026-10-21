package org.example;

import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Theory;
import java.io.InputStream;

public class Connection {
    private final Prolog engine = new Prolog();

    public Connection() throws Exception {
        try (InputStream in = getClass().getResourceAsStream("/calculos.pl")) {
            if (in == null) throw new IllegalStateException("No se encontró calculos.pl");
            engine.setTheory(new Theory(in));
        }
    }

    public String consultar(String predicado, String a, String b) throws Exception {
        if (!predicado.equals("suma") && !predicado.equals("resta"))
            throw new IllegalArgumentException("Operación no permitida");
        double n1 = Double.parseDouble(a.trim());
        double n2 = Double.parseDouble(b.trim());
        if (!Double.isFinite(n1) || !Double.isFinite(n2))
            throw new IllegalArgumentException("Los números deben ser finitos");
        String consulta = predicado + "(" + Double.toString(n1) + ", " + Double.toString(n2) + ", R).";
        SolveInfo info = engine.solve(consulta);
        return info.isSuccess() ? info.getTerm("R").toString() : "Sin solución para esa operación";
    }
}
