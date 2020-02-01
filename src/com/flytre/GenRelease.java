package com.flytre;

import com.flytre.eisenwave.nbt.NBTCompound;
import com.flytre.eisenwave.nbt.NBTNamedTag;
import com.flytre.eisenwave.nbt.io.NBTDeserializer;
import com.flytre.eisenwave.nbt.io.NBTSerializer;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Date;

public class GenRelease {

    private static final String SRC =  "/Users/aaron/Library/Application Support/minecraft/saves/laser_tag";
    private static final String END =  "/Users/aaron/Library/Application Support/minecraft/saves/laser_release";


    public static void main(String[] args) throws IOException {

        deleteDir(new File(END));
        File src = new File(SRC);
        File end = new File(END);
        copyDirectory(src,end);

        //remove all the extraneous files
        deleteDir(new File(END + "/advancements"));
        deleteDir(new File(END + "/stats"));
        deleteDir(new File(END + "/playerdata"));
        deleteDir(new File(END + "/.git"));
        deleteDir(new File(END + "/level.dat_old"));
        deleteDir(new File(END + "/datapacks/.datapack"));
        deleteDir(new File(END + "/datapacks/.git"));
        deleteDir(new File(END + "/datapacks/.idea"));
        deleteDir(new File(END + "/datapacks/.datapack"));
        deleteDir(new File(END + "/datapacks/datapacks.iml"));
        deleteDir(new File(END + "/datapacks/README.md"));
        deleteDir(new File(END + "/datapacks/out"));
        deleteDir(new File(END + "/datapacks/src"));
        deleteDir(new File(END + "/datapacks/todo.txt"));
        deleteDir(new File(END + "datapacks/flytre_custom_items/data/flytre/functions/testing.mcfunction"));


        prepareLevelDat();




    }


    public static void copyDirectory(File sourceDir, File targetDir) throws IOException {
        if (sourceDir.isDirectory()) {
            copyDirectoryRecursively(sourceDir, targetDir);
        } else {
            Files.copy(sourceDir.toPath(), targetDir.toPath());
        }
    }

    private static void copyDirectoryRecursively(File source, File target) throws IOException {
        if (!target.exists()) {
            target.mkdir();
        }
        for (String child : source.list()) {
            copyDirectory(new File(source, child), new File(target, child));
        }
    }

    private static void deleteDir(File file) {
        File[] contents = file.listFiles();
        if (contents != null) {
            for (File f : contents) {
                deleteDir(f);
            }
        }
        file.delete();
    }

    public static void prepareLevelDat() {
        File f = new File(END + "/level.dat");
        try {
            NBTNamedTag namedTag = new NBTDeserializer().fromFile(f);
            NBTCompound root = (NBTCompound) namedTag.getTag();
            NBTCompound data = root.getCompoundTag("Data");
            data.putLong("LastPlayed", (new Date()).getTime());
            data.put("Player", new NBTCompound());
            data.getCompoundTag("Player").putShort("Air",(short) 300);
            data.getCompoundTag("GameRules").putString("sendCommandFeedback","false");
            data.getCompoundTag("GameRules").putString("logAdminCommands","false");
            data.getCompoundTag("GameRules").putString("spectatorsGenerateChunks","false");



            new NBTSerializer().toFile(namedTag, f);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
