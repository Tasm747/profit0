package com.ab.profit.component;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

// Wird benutzt zum verschicken  von Notifications durch E-mail

public interface TemplateResolver 
{

	@Nonnull String resolve(@Nonnull String template, @Nullable Object model);
}
