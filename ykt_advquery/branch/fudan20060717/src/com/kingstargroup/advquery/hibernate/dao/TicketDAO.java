/**
 * 
 */
package com.kingstargroup.advquery.hibernate.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.kingstargroup.advquery.dept.TCifDept;
public class TicketDAO extends BasicDAO {
	/**
	 * Description:singleton pattern
	 * @return
	 * Modify History:
	 */
	public static TicketDAO getInstance() {
		if (_instance == null) {
			_instance = new TicketDAO();
		}
		return _instance;
	}
	
	/**
	 * Copyright (C), 2000-2006, Kingstar Co., Ltd.<br>
	 * File name: .java<br>
	 * Description: TradeSerialDAOƱ�ݳ�ֵ�б�<br>
	 * Return: List<br>
	 * Modify History: <br>
	 * ��������    ������     ����ʱ��       ��������<br>
	 * ======================================<br>
	 *  ����      ����ΰ     2006-5-10  <br>
	 * @author   ����ΰ
	 * @version 
	 * @since 1.0
	 */
	public List getTicketFillList(
			String deptNo,
			String ticketNo,
			int ticketType,
			String stuempno,
			String beginDate,
			String endDate,
			int cutType)throws HibernateException{
		Session s = getSession();
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append("select cust.STUEMP_NO,cust.CUT_NAME,dept.DEPT_NAME,sav.tx_date,")
		.append(" sav.tx_time,sav.bill_no,sav.amount,fee.TYPE_NAME")
		.append(" from YKT_CUR.T_TIF_SAVDTL sav inner join YKT_CUR.T_PIF_CARD card")
		.append(" on sav.card_no = card.card_id left join YKT_CUR.T_CIF_CUSTOMER cust")
		.append(" on card.COSUMER_ID = cust.CUT_ID left join ykt_cur.t_cif_dept dept")
		.append(" on cust.CLASSDEPT_NO=dept.DEPT_CODE left join YKT_CUR.T_CIF_CUTTYPEFEE fee")
		.append(" on cust.CUT_TYPE= fee.CUT_TYPE ")
		.append(" where sav.bill_type="+ticketType);
		if (!"-".equals(deptNo)){
			sqlStr.append(" and cust.classdept_no='"+deptNo+"'");
		}
		if (!"".equals(ticketNo)){
			sqlStr.append(" and sav.bill_no='"+ticketNo+"'");
		}
		if (!"".equals(stuempno)){
			sqlStr.append(" and cust.STUEMP_NO='"+stuempno+"'");
		}
		if (!"".equals(beginDate)){
			sqlStr.append(" and sav.tx_date>='"+beginDate+"'");
		}
		if (!"".equals(endDate)){
			sqlStr.append(" and sav.tx_date<='"+endDate+"'");
		}
		if (cutType!=0){
			sqlStr.append(" and cust.CUT_TYPE="+cutType);
		}
		sqlStr.append(" order by sav.tx_date desc");
		try {
			SQLQuery q = s.createSQLQuery(sqlStr.toString());
			q.addScalar("STUEMP_NO",Hibernate.STRING);
			q.addScalar("CUT_NAME",Hibernate.STRING);
			q.addScalar("DEPT_NAME",Hibernate.STRING);
			q.addScalar("tx_date",Hibernate.STRING);
			q.addScalar("tx_time",Hibernate.STRING);
			q.addScalar("bill_no",Hibernate.STRING);
			q.addScalar("amount",Hibernate.FLOAT);
			q.addScalar("TYPE_NAME",Hibernate.STRING);
			return q.list();
		} catch (HibernateException he) {
			he.printStackTrace();
			_log.error(he);
			return null;
		}	
	}
	
	public String getDeptNameByDeptNo(String deptNo)throws HibernateException{
		Session s = getSession();
		try {
			if (!"".equals(deptNo)){
				Query q = s.createQuery(" from TCifDept where deptCode='"+deptNo+"'");
				return ((TCifDept)q.list().get(0)).getDeptName();
			}else{
				return "";
			}
		} catch (HibernateException he) {
			_log.error(he);
			return null;
		}
	}
	
	/**
	 * �������ںͳ�ֵ����ȡ��ָ������Ʊ�ݻ򾭷ѱ��ĳ�ֵ����
	 * 2006-6-2
	 * hjw
	 * @param
	 * @return
	 */
	public String getTicketFillNumByDate(String date,int type){
		Session s= getSession();
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append("select COALESCE(count(*),0)as num from YKT_CUR.T_TIF_SAVDTL")
		.append(" where TX_DATE='"+date+"' and BILL_TYPE="+type);
		try {
			SQLQuery q = s.createSQLQuery(sqlStr.toString());
			q.addScalar("num",Hibernate.INTEGER);
			return q.list().get(0).toString();
		} catch (HibernateException he) {
			_log.error(he);
			return null;
		}
	}
	public String getTicketFillNumByMonth(String month,int type){
		Session s= getSession();
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append("select COALESCE(count(*),0)as num from YKT_CUR.T_TIF_SAVDTL")
		.append(" where substr(TX_DATE,1,6)='"+month+"' and BILL_TYPE="+type);
		try {
			SQLQuery q = s.createSQLQuery(sqlStr.toString());
			q.addScalar("num",Hibernate.INTEGER);
			return q.list().get(0).toString();
		} catch (HibernateException he) {
			_log.error(he);
			return null;
		}
	}
	public String getTicketFillMoneyByDate(String date,int type){
		Session s= getSession();
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append("select COALESCE(sum(amount),0) as money from YKT_CUR.T_TIF_SAVDTL")
		.append(" where TX_DATE='"+date+"' and BILL_TYPE="+type);
		try {
			SQLQuery q = s.createSQLQuery(sqlStr.toString());
			q.addScalar("money",Hibernate.FLOAT);
			return q.list().get(0).toString();
		} catch (HibernateException he) {
			_log.error(he);
			return null;
		}
	}
	public String getTicketFillMoneyByMonth(String month,int type){
		Session s= getSession();
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append("select COALESCE(sum(amount),0)as money from YKT_CUR.T_TIF_SAVDTL")
		.append(" where substr(TX_DATE,1,6)='"+month+"' and BILL_TYPE="+type);
		try {
			SQLQuery q = s.createSQLQuery(sqlStr.toString());
			q.addScalar("money",Hibernate.FLOAT);
			return q.list().get(0).toString();
		} catch (HibernateException he) {
			_log.error(he);
			return null;
		}
	}
	
	public List getFillType()throws HibernateException{
		Session s = getSession();
		try {
			Query q = s.createQuery(" from TPifDictionary where id.dictNo=63");
			return q.list();
		} catch (HibernateException he) {
			_log.error(he);
			return null;
		}
	}
	
	private static TicketDAO _instance;
	private Log _log = LogFactory.getLog(TicketDAO.class.getClass());
}