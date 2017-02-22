package com.peace.ostp.service;

import java.util.List;
import java.util.Map;

public interface IInfoSecondLevelType {

	List<Map<String, String>> getSecondLevelTypeByFirstID(String firstLevelTypeID);
	List<Map<String, String>> getSecondLevelTypeForFirstLevel();
	List<Map<String, String>> getAllSecondLevelType();
}
