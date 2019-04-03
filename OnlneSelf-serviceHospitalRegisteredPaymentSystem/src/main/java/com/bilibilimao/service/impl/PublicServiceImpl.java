package com.bilibilimao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bilibilimao.mapper.PatientMapper;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	@Autowired
	private PatientMapper patientMapper;
	@Override
	public boolean idCardIsRegistered(Patient patient) {
		patient = patientMapper.findPatient(patient);
		if(patient != null) {
			return true;
		}
		return false;
	}
	@Override
	public String idCardFindPassword(Patient patient) {
		patient = patientMapper.findPatient(patient);
		if(patient == null) {
			return null;
		}
		else {
			return("{\"" + patient.getId() + "\":\"" + patient.getSafetyProblem() + "\"}");
		}
	}
}