package com.example.milkteaweb.util;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletHelper {
    private ServletHelper() {
        // do nothing
    }

    public static void returnResp(HttpServletResponse resp, int status) {
        try (PrintWriter out = resp.getWriter()) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            out.print("{\"status\": " + status + "}");
            out.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
