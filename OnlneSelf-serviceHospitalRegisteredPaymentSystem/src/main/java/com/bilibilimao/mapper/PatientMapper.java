package com.bilibilimao.mapper;

import com.bilibilimao.po.Patient;

public interface PatientMapper {
	public int insertPatient(Patient patient);
	public Patient findPatient(Patient patient);
	public int updatePatient(Patient patient);
}