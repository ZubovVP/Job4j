package ru.job4j.chat;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertTrue;

/**
 * Created by Intellij IDEA.
 * User: Vitaly Zubov.
 * Email: Zubov.VP@yandex.ru.
 * Version: $Id$.
 * Date: 28.08.2019.
 */
public class ChatTest {
    private File file = new File("./src/main/java/ru/job4j/chat/phrases.txt");
    private File log = new File("./src/main/java/ru/job4j/chat/answers.txt");
    private StringBuilder questions = new StringBuilder();

    @Before
    public void prepareOutputStream() {
        this.questions.append("стоп\n");
        this.questions.append("Как дела?\n");
        this.questions.append("Как день прошёл?\n");
        this.questions.append("старт\n");
        this.questions.append("Что делаешь?\n");
        this.questions.append("закончить\n");
        String data = questions.toString();
        InputStream is = new ByteArrayInputStream(data.getBytes());
        System.setIn(is);
        new Chat(this.log.getPath(), this.file.getPath()).start();
    }

    @Before
    public void start() throws IOException {
        this.log.createNewFile();
    }

    @After
    public void backOutput() {
        this.log.delete();
    }

    @Test
    public void checkAnsersOfUser() {
        List<String> result = new ArrayList<>();
        try (FileReader reader = new FileReader(this.log);
             BufferedReader bfr = new BufferedReader(reader)) {
            String line = bfr.readLine();
            while (line != null) {
                result.add(line.split(": ")[1]);
                line = bfr.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        assertTrue(result.contains("стоп"));
        assertTrue(result.contains("Как дела?"));
        assertTrue(result.contains("Что делаешь?"));
        assertTrue(result.contains("закончить"));
    }

    @Test
    public void checkAnswersOfBot() {
        List<String> result = new ArrayList<>();
        try (FileReader reader = new FileReader(this.log);
             BufferedReader bfr = new BufferedReader(reader)) {
            String line = bfr.readLine();
            while (line != null) {
                result.add(line);
                line = bfr.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        assertThat(result.size() - this.questions.toString().split("\n").length, is(2));
    }
}