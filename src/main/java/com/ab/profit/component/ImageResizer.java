package com.ab.profit.component;

import java.io.IOException;
import java.nio.file.Path;

import javax.annotation.Nonnull;

//Bild verkleiner.

public interface ImageResizer 
{

	void resizeImage(@Nonnull Path sourceImageFile, @Nonnull Path destImageFile, int width, int height) throws IOException;
}
