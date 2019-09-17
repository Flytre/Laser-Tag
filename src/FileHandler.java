import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Scanner;

class FileHandler {

    private static String output;


    static Scanner get(String filename) {
        Scanner file = null;
        try {
            file = new Scanner(new File("resources/" + filename));
            return file;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            file.close();
            return null;
        }
    }

    static String readFile(String path) {
        byte[] encoded = new byte[0];
        try {
            encoded = Files.readAllBytes(Paths.get(path));
            return new String(encoded, StandardCharsets.US_ASCII);
        } catch (IOException e) {
            return null;
        }

    }

    static void setOutput(String location) {
        output = location;
    }

    static void print(String msg) {
        File out = new File(output);
        try {
            out.getParentFile().mkdirs();
            out.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try (PrintWriter toFile = new PrintWriter(new FileWriter(output, true))) {
            toFile.println(msg);
            toFile.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    static void createDatapack(String name) {
        try {
            boolean b = (new File(name)).mkdirs();

            boolean b2 = (new File(name + "/pack.mcmeta")).createNewFile();

            setOutput( name + "/pack.mcmeta");
            print("{\n" +
                    "  \"pack\": {\n" +
                    "    \"pack_format\": 4,\n" +
                    "    \"description\": \"Custom items generated by Flytre\"\n" +
                    "  }\n" +
                    "}");
            boolean b4 = (new File(  name + "/data/flytre/functions")).mkdirs();

            boolean b5 = (new File(  name + "/data/minecraft/tags/functions")).mkdirs();


        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static boolean deleteDirectory(String dir) {
        File directoryToBeDeleted = new File(dir);

        File[] allContents = directoryToBeDeleted.listFiles();

        if (allContents != null) {
            for (File file : allContents) {
                deleteDirectory(file);
            }
        }
        return directoryToBeDeleted.delete();
    }

    static boolean deleteDirectory(File directoryToBeDeleted) {
        File[] allContents = directoryToBeDeleted.listFiles();
        if (allContents != null) {
            for (File file : allContents) {
                deleteDirectory(file);
            }
        }
        return directoryToBeDeleted.delete();
    }

}