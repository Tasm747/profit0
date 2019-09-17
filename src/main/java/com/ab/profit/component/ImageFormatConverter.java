package com.ab.profit.component;

import java.io.IOException;
import java.nio.file.Path;

import javax.annotation.Nonnull;

// Konvertiert Bild fomate von einem zu anderem. (png zu jpeg)

public interface ImageFormatConverter 
{

	void convertImage(@Nonnull Path sourceImageFile, @Nonnull Path destImageFile) throws IOException;
}
