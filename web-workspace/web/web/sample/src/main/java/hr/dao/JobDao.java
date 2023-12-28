package hr.dao;

import java.util.List;

import helper.JdbcTemplate;
import hr.vo.Job;

public class JobDao {
	public void insertJob(Job job) {
		String sql = """
				INSERT INTO JOBS
				(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
				VALUES
				(?, ?, ?, ?)
			""";
		
		JdbcTemplate.insert(sql, job.getId(),
								 job.getTitle(),
								 job.getMinSalary(),
								 job.getMaxSalary());
	}
	
	public List<Job> getAllJobs() {
		String sql = """
				SELECT
						JOB_ID,
						JOB_TITLE,
						MIN_SALARY,
						MAX_SALARY
				FROM
						JOBS
			""";
		
		return JdbcTemplate.selectList(sql, rs -> {
			Job job = new Job();
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getInt("min_salary"));
			job.setMaxSalary(rs.getInt("max_salary"));
			
			return job;
		});
	}
	
	public Job getJobById(String id) {
		String sql = """
				SELECT
						JOB_ID,
						JOB_TITLE,
						MIN_SALARY,
						MAX_SALARY
				FROM
						JOBS
				WHERE
						JOB_ID = ?
			""";
		
		return JdbcTemplate.selectOne(sql, rs -> {
			Job job = new Job();
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getInt("min_salary"));
			job.setMaxSalary(rs.getInt("max_salary"));
			
			return job;
		}, id);
	}
}
