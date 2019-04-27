package com.bilibilimao.service.impl;

import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bilibilimao.mapper.PatientMapper;
import com.bilibilimao.po.Patient;
import com.bilibilimao.service.PatientService;
import com.bilibilimao.utils.Base64stringAndByteArray;
import com.bilibilimao.utils.SerializeAndBase64string;
import com.bilibilimao.utils.SerializeUtils;
import com.bilibilimao.utils.UUIDGenerator;
import redis.clients.jedis.Jedis;

@Service
public class PatientServiceImpl implements PatientService {
	@Autowired
	private PatientMapper patientMapper;
	@Autowired
	private Jedis jedis;
	@Override
	public int registeredAccount(Patient patient, String answer) {
		Date registrationTime = new Date(new java.util.Date().getTime());
		patient.setRegistrationTime(registrationTime);
		patient.setSafetyProblem(patient.getSafetyProblem() + answer);
		int result = patientMapper.insertPatient(patient);
		return(result);
	}
	@Override
	public Patient findPatient(Patient patient) {
		patient = patientMapper.findPatient(patient);
		return(patient);
	}
	@Override
	public String addPatientToRedis(Patient patient) {
		byte[] bs = SerializeUtils.serialize(patient);
		String uuid = UUIDGenerator.simplifyUUID();
		jedis.setex(uuid, 1800, Base64stringAndByteArray.byteArrayToBase64string(bs));
		return(uuid);
	}
	@Override
	public int updateToFindPassword(Patient patient) {
		int a = patientMapper.updatePatient(patient);
		return(a);
	}
	@Override
	public void removePatient(String uuid) {
		jedis.del(uuid);	
	}
	@Override
	public void updateToPatientInfo(Patient patient, String uuid) {
		patientMapper.updatePatient(patient);
		Patient patient2 = (Patient)SerializeAndBase64string.Base64stringToSerialize(jedis.get(uuid));
		patient2.setAddress(patient.getAddress());
		patient2.setNumber(patient.getNumber());
		jedis.setex(uuid, 1800, SerializeAndBase64string.SerializeToBase64string(patient2));
	}
}