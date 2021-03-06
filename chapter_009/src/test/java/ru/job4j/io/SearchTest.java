package ru.job4j.io;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

/**
 * Created by Intellij IDEA.
 * User: Vitaly Zubov.
 * Email: Zubov.VP@yandex.ru.
 * Version: $Id$.
 * Date: 14.08.2019.
 */
public class SearchTest {
    private File file = new File("./Test");

    @Before
    public void start() throws Exception {
        this.file.mkdir();
        for (int x = 0; x < 5; x++) {
            StringBuilder sb = new StringBuilder();
            sb.append("./Test");
            sb.append(File.separator);
            sb.append(x);
            File dir = new File(sb.toString());
            dir.mkdir();
            sb.append(File.separator).append("Text");
            sb.append(x);
            sb.append(".txt");
            dir = new File(sb.toString());
            dir.createNewFile();
            if (x % 2 == 1) {
                sb = new StringBuilder();
                sb.append("./Test");
                sb.append(File.separator);
                sb.append(x);
                sb.append(File.separator).append("Text");
                sb.append(x);
                sb.append(".xml");
                dir = new File(sb.toString());
                dir.createNewFile();
            }
            if (x % 3 == 0) {
                sb = new StringBuilder();
                sb.append("./Test");
                sb.append(File.separator);
                sb.append(x);
                sb.append(File.separator).append("Text");
                sb.append(x);
                sb.append(".word");
                dir = new File(sb.toString());
                dir.createNewFile();
            }
        }
    }

    @After
    public void finish() {
        deleteDirectory(this.file);
    }

    @Test
    public void findTest() {
        Search search = new Search();
        List<File> files = search.find("./Test");
        assertThat(files.size(), is(9));
    }

    @Ignore
    public void checkTest() {
        Search search = new Search();
        List<String> exts = new ArrayList<>();
        List<File> files = search.find(this.file.getAbsolutePath());
        exts.add("xml");
        assertThat(search.check(files, exts).size(), is(2));
        exts.add("txt");
        assertThat(search.check(files, exts).size(), is(7));
        exts.remove("xml");
        assertThat(search.check(files, exts).size(), is(5));
        exts.add("word");
        assertThat(search.check(files, exts).size(), is(7));
        exts.add("xml");
        assertThat(search.check(files, exts).size(), is(9));
        exts.clear();
        assertThat(search.check(files, exts).size(), is(0));

    }

    @Test
    public void expTest() {
        Search search = new Search();
        List<String> exts = new ArrayList<>();
        exts.add("xml");
        List<File> files = search.find(this.file.getAbsolutePath());
        List<File> result = search.check(files, exts);
        for (File file1 : result) {
            String exp = file1.getAbsolutePath().split("\\.")[1];
            assertThat(exp, is("xml"));
        }
        exts.clear();
        exts.add("text");
        result = search.check(files, exts);
        for (File file1 : result) {
            String exp = file1.getAbsolutePath().split("\\.")[1];
            assertThat(exp, is("text"));
        }
    }

    private void deleteDirectory(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (String child : children) {
                File f = new File(dir, child);
                deleteDirectory(f);
            }
            dir.delete();
        } else {
            dir.delete();
        }
    }
}

