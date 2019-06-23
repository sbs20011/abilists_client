//package com.abilists.client.main;
//
//import java.io.File;
//import java.io.InputStream;
//import java.net.URL;
//import java.net.URLClassLoader;
//import java.util.jar.Attributes;
//import java.util.jar.Manifest;
//
//import com.abilists.core.service.AbilistsAbstractService;
//
//public class PluginMain {
//
//	public static void main(String[] args) throws Exception {
//
//		StringBuilder sbPluginsPath = new StringBuilder();
//		sbPluginsPath.append(AbilistsAbstractService.USER_HOME).append("/")
//			.append("git/abilists_plugins/plugins/").append("plugin_survey-0.0.1.sfn");
//
//		File file = new File(sbPluginsPath.toString());
//		// File file = new File("/home/joonk/.abilists/plugins/plugin_survey-0.0.1.sfn");
//
//		URL fileURL = file.toURI().toURL();
//		String jarURL = "jar:" + fileURL + "!/";
//		URL urls [] = { new URL(jarURL) };
//		URLClassLoader loader = new URLClassLoader(urls);
//		Class<?> clazz = Class.forName("com.abilists.plugin.survey.service.SurveyService", true, loader);
//
////		LtapService ltapService = (LtapService)clazz.newInstance();
//
////		System.out.println(">>> test = " + ltapService.loginLtap());
//
//		Manifest manifest = getManifest(clazz);
//		Attributes version = manifest.getMainAttributes();
//		String strVersion = version.getValue("Implementation-Title");
//		System.out.println("value=" + strVersion);
//	}
//
//	public static Manifest getManifest(Class<?> clz) {
//		String resource = "/" + clz.getName().replace(".", "/") + ".class";
//		String fullPath = clz.getResource(resource).toString();
//		String canonicalName = clz.getCanonicalName();
//		String archivePath = fullPath.substring(0, fullPath.length() - resource.length());
//		if (archivePath.endsWith("\\WEB-INF\\classes") || archivePath.endsWith("/WEB-INF/classes")) {
//			archivePath = archivePath.substring(0, fullPath.length() - "/WEB-INF/classes".length()); //Required for wars
//		}
//		try (InputStream input = new URL(archivePath + "/META-INF/MANIFEST.MF").openStream()) {
//			return new Manifest(input);		
//		} catch (Exception e) {
//			throw new RuntimeException("Loading MANIFEST for class " + clz + "failed!", e);
//		}
//	}
//
//}
