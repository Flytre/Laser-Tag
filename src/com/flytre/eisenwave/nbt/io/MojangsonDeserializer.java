package com.flytre.eisenwave.nbt.io;

import com.flytre.eisenwave.nbt.NBTNamedTag;
import com.flytre.eisenwave.io.TextDeserializer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.stream.Collectors;

public class MojangsonDeserializer implements TextDeserializer<NBTNamedTag> {
    
    @Override
    public NBTNamedTag fromReader(Reader reader) throws IOException {
        BufferedReader buffReader = reader instanceof BufferedReader?
            (BufferedReader) reader :
            new BufferedReader(reader);
        
        String mson = buffReader.lines().collect(Collectors.joining());
        
        return MojangsonParser.parse(mson);
    }

    public static void main(String[] args) {
        System.out.println("hi");
    }
    
}
