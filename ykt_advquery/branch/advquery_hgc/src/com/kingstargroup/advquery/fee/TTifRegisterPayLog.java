package com.kingstargroup.advquery.fee;
// Generated by MyEclipse - Hibernate Tools



/**
 * TTifRegisterPayLog generated by MyEclipse - Hibernate Tools
 */
public class TTifRegisterPayLog extends AbstractTTifRegisterPayLog implements java.io.Serializable {

    // Constructors

    /** default constructor */
    public TTifRegisterPayLog() {
    }

	/** minimal constructor */
    public TTifRegisterPayLog(TTifRegisterPayLogId id) {
        super(id);        
    }
    
    /** full constructor */
    public TTifRegisterPayLog(TTifRegisterPayLogId id, String cutName, long registerFlag, String registerInfo, long flag, long reserverNo1, String systemNo, String modifyDate, String modifyTime, long lastRegisterFlag, long regId, String comments) {
        super(id, cutName, registerFlag, registerInfo, flag, reserverNo1, systemNo, modifyDate, modifyTime, lastRegisterFlag, regId, comments);        
    }    
   
}