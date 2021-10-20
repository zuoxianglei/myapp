package io.renren;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.job.dao.ScheduleJobDao;
import io.renren.modules.job.entity.ScheduleJobEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @ClassName: Test1
 * @ProjectName : renren-fast
 * @Author : zuoxianglei
 * @Time : 2021/10/1 8:30
 * @Description : 描述信息
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class Test1 {
    @Autowired
    ScheduleJobDao scheduleJobDao;

    @Test
    public void tset1(){

        ScheduleJobEntity scheduleJobEntity1 = null;

        Long[] jobIds = new Long[]{1L};
        int status = 0;
        for (Long jobId : jobIds) {
            QueryWrapper<ScheduleJobEntity> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("job_id",jobId);
            ScheduleJobEntity scheduleJobEntity = scheduleJobDao.selectOne(queryWrapper);
            scheduleJobEntity1 =new ScheduleJobEntity();
            BeanUtils.copyProperties(scheduleJobEntity,scheduleJobEntity1);
            Integer status1 = scheduleJobEntity.getStatus();
            if (status1 == 1){
                scheduleJobEntity1.setStatus(status);
            }
            if (status1 == 0){
                scheduleJobEntity1.setStatus(status);
            }
            scheduleJobDao.updateById(scheduleJobEntity1);
        }
    }
}
