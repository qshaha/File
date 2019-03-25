package com.bilibilimao.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bilibilimao.mapper.PatientMapper;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PatientService;

@Service
public class PatientServiceImpl implements PatientService {
	@Autowired
	private PatientMapper patientMapper;
	@Override
	public int registeredAccount(Patient patient, String answer) {
		Date registrationTime = new Date(new java.util.Date().getTime());
		patient.setRegistrationTime(registrationTime);
		patient.setSafetyProblem(patient.getSafetyProblem() + answer);
		int result = patientMapper.insertPatient(patient);
		return(result);
	}
}