package com.flytre;


import com.flytre.eisenwave.nbt.NBTCompound;
import com.flytre.eisenwave.nbt.NBTNamedTag;
import com.flytre.eisenwave.nbt.io.NBTDeserializer;
import com.flytre.eisenwave.nbt.io.NBTSerializer;

import java.io.File;
import java.io.IOException;
import java.util.Date;

public class Test {

    private static final String INPUT_GZIP_FILE = "/Users/aaron/Library/Application Support/minecraft/saves/laser_release/level.dat";

    public static void main( String[] args )
    {
        prepareLevelDat();
    }

    public static void prepareLevelDat(){
        File f = new File(INPUT_GZIP_FILE);
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
