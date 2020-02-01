package com.flytre.eisenwave.nbt.io;

import com.flytre.eisenwave.io.Serializer;
import com.flytre.eisenwave.nbt.NBTNamedTag;

import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;

public class NBTSerializer implements Serializer<NBTNamedTag> {
    
    private final boolean compress;
    
    /**
     * Constructs a new NBT-Serializer.
     *
     * @param compress whether to use gzip compression.
     */
    public NBTSerializer(boolean compress) {
        this.compress = compress;
    }
    
    /**
     * Constructs a new NBT-Serializer with enabled gzip compression.
     */
    public NBTSerializer() {
        this(true);
    }
    
    @Override
    public void toStream(NBTNamedTag tag, OutputStream stream) throws IOException {
        if (compress) {
            GZIPOutputStream gzipStream = new GZIPOutputStream(stream);
            NBTOutputStream nbtStream = new NBTOutputStream(gzipStream);
            nbtStream.writeNamedTag(tag);
            gzipStream.finish();
        }
        else {
            new NBTOutputStream(stream).writeNamedTag(tag);
        }
    }
    
}
