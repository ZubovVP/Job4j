package ru.job4j.servlets;


import org.codehaus.jackson.map.ObjectMapper;
import ru.job4j.models.Person;
import ru.job4j.storage.MyStorage;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Intellij IDEA.
 * User: Vitaly Zubov.
 * Email: Zubov.VP@yandex.ru.
 * Version: $Id$.
 * Date: 28.04.2019.
 */
public class JsonController extends HttpServlet {
    private MyStorage storage = MyStorage.getInstance();

    /**
     * Get all users from storage.
     *
     * @param req  - request.
     * @param resp - response.
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.addHeader("Access-Control-Allow-Origin", "*"); // Cros
        List<Person> products = storage.getAllPersons();
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(products);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter writer = resp.getWriter();
        writer.print(json);
        writer.flush();
    }

    /**
     * Put the user in the storage.
     *
     * @param req  - request.
     * @param resp - response.
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        resp.setContentType("text/json");
        resp.addHeader("Access-Control-Allow-Origin", "*"); // Cros
        Person person = new Person(req.getParameter("name"), req.getParameter("surname"), req.getParameter("id"), req.getParameter("sex"), req.getParameter("description"));
        storage.addPerson(person);
    }
}
