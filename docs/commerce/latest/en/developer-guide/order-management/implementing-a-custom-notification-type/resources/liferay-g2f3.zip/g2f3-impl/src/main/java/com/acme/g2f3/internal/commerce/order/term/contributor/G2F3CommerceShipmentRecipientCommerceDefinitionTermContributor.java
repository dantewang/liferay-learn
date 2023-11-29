package com.acme.g2f3.internal.commerce.order.term.contributor;

import com.liferay.account.model.AccountEntry;
import com.liferay.commerce.constants.CommerceDefinitionTermConstants;
import com.liferay.commerce.model.CommerceShipment;
import com.liferay.commerce.order.CommerceDefinitionTermContributor;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.UserLocalService;
import com.liferay.portal.kernel.util.HashMapBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(
	property = {
		"commerce.definition.term.contributor.key=" + CommerceDefinitionTermConstants.RECIPIENT_DEFINITION_TERMS_CONTRIBUTOR,
		"commerce.notification.type.key=g2f3"
	},
	service = CommerceDefinitionTermContributor.class
)
public class G2F3CommerceShipmentRecipientCommerceDefinitionTermContributor
	implements CommerceDefinitionTermContributor {

	@Override
	public String getFilledTerm(String term, Object object, Locale locale)
		throws PortalException {

		if (!(object instanceof CommerceShipment)) {
			return term;
		}

		CommerceShipment commerceShipment = (CommerceShipment)object;

		if (commerceShipment == null) {
			return term;
		}

		if (term.equals(_SHIPMENT_CREATOR_EMAIL)) {
			AccountEntry accountEntry = commerceShipment.getAccountEntry();

			if (accountEntry.isPersonalAccount()) {
				User user = _userLocalService.getUser(accountEntry.getUserId());

				return String.valueOf(user.getUserId());
			}

			return String.valueOf(commerceShipment.getUserId());
		}

		return term;
	}

	@Override
	public String getLabel(String term, Locale locale) {
		return LanguageUtil.get(locale, _languageKeys.get(term));
	}

	@Override
	public List<String> getTerms() {
		return new ArrayList<>(_languageKeys.keySet());
	}

	private static final String _SHIPMENT_CREATOR_EMAIL =
		"[%SHIPMENT_CREATOR_EMAIL%]";

	private static final Map<String, String> _languageKeys = HashMapBuilder.put(
		_SHIPMENT_CREATOR_EMAIL, "g2f3-shipment-creator-email-definition-term"
	).build();

	@Reference
	private UserLocalService _userLocalService;

}