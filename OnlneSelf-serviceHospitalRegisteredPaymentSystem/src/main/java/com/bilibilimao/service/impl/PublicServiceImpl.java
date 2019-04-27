package com.bilibilimao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bilibilimao.mapper.PatientMapper;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PublicService;
import com.bilibilimao.utils.SerializeAndBase64string;
import redis.clients.jedis.Jedis;

@Service
public class PublicServiceImpl implements PublicService {
	@Autowired
	private PatientMapper patientMapper;
	@Autowired
	private Jedis jedis;
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
	@Override
	public String findOldPassword(String uuid) {
		Patient patient = (Patient)SerializeAndBase64string.Base64stringToSerialize(jedis.get(uuid));
		return(patient.getPassword());
	}
}