package com.bilibilimao.mapper;

import java.util.List;
import com.bilibilimao.po.Doctor;

public interface DoctorMapper {
	public void insertDoctor(Doctor doctor) throws Exception;
	public List<Doctor> findDoctor(Doctor doctor);
	public int deleteDoctor(Doctor doctor);
	public void updateDoctor(Doctor doctor) throws Exception;
}