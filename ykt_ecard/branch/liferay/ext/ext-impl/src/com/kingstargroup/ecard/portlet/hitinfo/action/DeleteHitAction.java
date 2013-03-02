/**
 * 
 */
package com.kingstargroup.ecard.portlet.hitinfo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.kingstargroup.ecard.exceptions.PortalException;
import com.kingstargroup.ecard.portlet.hitinfo.service.HitInfoServiceUtil;
import com.kingstargroup.ecard.util.EcardConstants;
import com.liferay.portal.struts.PortletAction;
import com.liferay.util.servlet.SessionErrors;

/**
 * Copyright (C), 2000-2005, Kingstar Co., Ltd.<br>
 * File name: DeleteHitAction.java<br>
 * Description: <br>
 * Modify History: <br>
 * ��������   ������   ����ʱ��     ��������<br>
 * ===================================<br>
 *  ����    Xiao Qi  2005-11-21  <br>
 * @author Xiao Qi
 * @version 
 * @since 1.0
 */
public class DeleteHitAction extends PortletAction {

	/* (non-Javadoc)
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward execute(
			ActionMapping mapping, ActionForm form, HttpServletRequest req,
			HttpServletResponse res)
		throws Exception {
		try {
			String[] ids = req.getParameterValues("ids");
			if (ids == null) {
				SessionErrors.add(req, EcardConstants.CHOOSE_DEL_CONTENT);			
				return mapping.findForward("portlet.ecardhit.admin");
			}
			HitInfoServiceUtil.delete(ids);
			SessionErrors.add(req, EcardConstants.DELETE_INFO_SUCCEED);
			
		} catch (PortalException pe) {
			SessionErrors.add(req, EcardConstants.DELETE_INFO_FAILED);			
		}
		return mapping.findForward("portlet.ecardhit.admin");
	}

}