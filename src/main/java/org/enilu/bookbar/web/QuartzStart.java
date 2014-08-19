package org.enilu.bookbar.web;

import org.enilu.bookbar.job.CollectorJob;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.impl.JobDetailImpl;
import org.quartz.impl.triggers.CronTriggerImpl;

/**
 * 启动定时任务
 * <p/>
 * 2014年8月19日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class QuartzStart {
	private static final Log log = Logs.get();
	private static QuartzStart instance;

	private QuartzStart() {

	}

	public static QuartzStart start() {
		if (instance == null) {
			System.out.println("quartz init...");
			instance = new QuartzStart();
			startJobs();
		}

		return instance;
	}

	private static void startJobs() {
		try {
			SchedulerFactory schedFact = new org.quartz.impl.StdSchedulerFactory();
			Scheduler sched = schedFact.getScheduler();
			sched.start();
			JobDetail jobDetail = new JobDetailImpl("collector",
					"collector-group", CollectorJob.class);

			CronTriggerImpl trigger = new CronTriggerImpl("collector-trigger",
					"collector-group");
			/**//* 每1分钟执行一次 */

			trigger.setCronExpression("0 3 18 * * ?");
			sched.scheduleJob(jobDetail, trigger);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
