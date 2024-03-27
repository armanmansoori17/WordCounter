import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WordCounterServlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String sentence = request.getParameter("sentence");
        sentence = sentence.replaceAll("[^a-zA-Z ]", "");

        String[] counter = sentence.split("\\s+");
        int count = counter.length;

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.println(count);
    }
}
