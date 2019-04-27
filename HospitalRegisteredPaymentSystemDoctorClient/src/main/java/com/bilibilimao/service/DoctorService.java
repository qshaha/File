package com.bilibilimao.service;

import java.util.List;
import com.bilibilimao.po.Doctor;

public interface DoctorService {
	public void insertDoctor(Doctor doctor) throws Exception;
	public String findDoctorAndLogin(Doctor doctor);
	public void deleteDoctor(Doctor doctor) throws Exception;
	public List<Doctor> findAllDoctor();
	public void updateDoctorPhoto(Doctor doctor) throws Exception;
	public void updateDoctorPassword(Doctor doctor) throws Exception;
	public boolean updateDoctorDefaultPassword(String doctorAccount) throws Exception;
}