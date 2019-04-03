package com.bilibilimao.service;

import com.bilibilimao.po.Patient;

public interface PatientService {
	public int registeredAccount(Patient patient, String answer);
	public Patient findPatient(Patient patient);
	public String addPatientToRedis(Patient patient);
	public int updateToFindPassword(Patient patien);
}