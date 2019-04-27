package com.bilibilimao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bilibilimao.mapper.DoctorMapper;
import com.bilibilimao.po.Doctor;
import com.bilibilimao.service.DoctorService;
import com.bilibilimao.utils.SerializeAndBase64string;
import com.bilibilimao.utils.UUIDGenerator;
import redis.clients.jedis.Jedis;

@Service
public class DoctorServiceImpl implements DoctorService  {
	@Autowired
	private DoctorMapper doctorMapper;
	@Autowired
	private Jedis jedis;
	@Override
	public void insertDoctor(Doctor doctor) throws Exception {
		doctorMapper.insertDoctor(doctor);
		jedis.hset("doctorInfo", doctor.getAccount(), SerializeAndBase64string.SerializeToBase64string(doctor));
	}
	@Override
	public String findDoctorAndLogin(Doctor doctor) {
		List<Doctor> list = doctorMapper.findDoctor(doctor);
		if(list != null && list.size() > 0) {
			String uuid = UUIDGenerator.simplifyUUID();
			jedis.setex(uuid, 1800, SerializeAndBase64string.SerializeToBase64string(list.get(0)));
			return(uuid);
		}
		return null;
	}
	@Override
	public void deleteDoctor(Doctor doctor) throws Exception {
		doctorMapper.deleteDoctor(doctor);
		jedis.hdel("doctorInfo", doctor.getAccount());
	}
	@Override
	public List<Doctor> findAllDoctor() {
		List<String> list = jedis.hvals("doctorInfo");
		if(list == null || list.size() == 0) {
			return null;
		}
		List<Doctor> list2 = new ArrayList<Doctor>();
		for(String s : list) {
			list2.add((Doctor)SerializeAndBase64string.Base64stringToSerialize(s));
		}
		return(list2);
	}
	@Override
	public void updateDoctorPhoto(Doctor doctor) throws Exception {
		doctorMapper.updateDoctor(doctor);
		doctor = doctorMapper.findDoctor(doctor).get(0);
		jedis.hset("doctorInfo", doctor.getAccount(), SerializeAndBase64string.SerializeToBase64string(doctor));
	}
	@Override
	public void updateDoctorPassword(Doctor doctor) throws Exception {
		doctorMapper.updateDoctor(doctor);
		doctor = doctorMapper.findDoctor(doctor).get(0);
		jedis.hset("doctorInfo", doctor.getAccount(), SerializeAndBase64string.SerializeToBase64string(doctor));
	}
	@Override
	public boolean updateDoctorDefaultPassword(String doctorAccount) throws Exception {
		Map<String, String> map = jedis.hgetAll("doctorInfo");
		if(!map.containsKey(doctorAccount)) {
			return false;
		}
		Doctor doctor = new Doctor();
		doctor.setId(((Doctor)SerializeAndBase64string.Base64stringToSerialize(map.get(doctorAccount))).getId());
		doctor.setPassword("123456");
		doctorMapper.updateDoctor(doctor);
		return true;
	}
}