/**
 * Copyright (c) 2021 DB Netz AG and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v20.html
 */
package org.eclipse.set.feature.plaz.schema;

/**
 * Helper class to provide resource paths to the PlaZ Schema included in this
 * bundle
 * 
 * @author Stuecker
 */
public class PlaZSchema {

	private static final String RESOURCE_BASE = "/res/"; //$NON-NLS-1$

	/**
	 * @return The base path for resources provided by this bundle
	 */
	public static String getResourceBase() {
		return RESOURCE_BASE;
	}
}
