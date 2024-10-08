package com.acme.e5c9.internal.workflow.kaleo.runtime.scripting.internal.action;

import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.UserLocalService;
import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.LocalizationUtil;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.kernel.workflow.WorkflowException;
import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
import com.liferay.portal.workflow.kaleo.definition.ActionType;
import com.liferay.portal.workflow.kaleo.model.KaleoAction;
import com.liferay.portal.workflow.kaleo.runtime.ExecutionContext;
import com.liferay.portal.workflow.kaleo.runtime.action.executor.ActionExecutor;
import com.liferay.portal.workflow.kaleo.runtime.action.executor.ActionExecutorException;
import com.liferay.portal.workflow.kaleo.service.KaleoDefinitionLocalService;
import com.liferay.portal.workflow.manager.WorkflowDefinitionManager;

import java.io.Serializable;

import java.util.Map;
import java.util.Objects;

import org.osgi.service.component.annotations.Activate;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(
	immediate = true,
	service = ActionExecutor.class
)
public class E5C9ActionExecutor implements ActionExecutor {

	@Override
	public void execute(
			KaleoAction kaleoAction, ExecutionContext executionContext)
		throws ActionExecutorException {

		try {
			Map<String, Serializable> workflowContext =
				executionContext.getWorkflowContext();

			if (Objects.equals(
					workflowContext.get("transitionName"), "reject")) {

				WorkflowStatusManagerUtil.updateStatus(
					WorkflowConstants.STATUS_DENIED, workflowContext);
				WorkflowStatusManagerUtil.updateStatus(
					WorkflowConstants.STATUS_PENDING, workflowContext);
			}
			else if (Objects.equals(
						workflowContext.get("transitionName"), "approve")) {

				WorkflowStatusManagerUtil.updateStatus(
					WorkflowConstants.STATUS_APPROVED, workflowContext);
			}
		}
		catch (WorkflowException workflowException) {
			_log.error(workflowException, workflowException);

			throw new ActionExecutorException(workflowException);
		}
	}

	@Override
	public String getActionExecutorKey() {
		return "java";
	}

	@Activate
	protected void activate() throws Exception {
		User user = _userLocalService.getDefaultUser(
			_portal.getDefaultCompanyId());

		_workflowDefinitionManager.deployWorkflowDefinition(
			_portal.getDefaultCompanyId(), user.getUserId(),
			LocalizationUtil.updateLocalization(
				StringPool.BLANK, "title", "E5C9 Single Approver",
				LocaleUtil.toLanguageId(LocaleUtil.getDefault())),
			"E5C9 Single Approver",
			FileUtil.getBytes(
				getClass(), "dependencies/e5c9-workflow-definition.xml"));
	}

	private static final Log _log = LogFactoryUtil.getLog(
		E5C9ActionExecutor.class);

	@Reference
	private KaleoDefinitionLocalService _kaleoDefinitionLocalService;

	@Reference
	private Portal _portal;

	@Reference
	private UserLocalService _userLocalService;

	@Reference
	private WorkflowDefinitionManager _workflowDefinitionManager;

}