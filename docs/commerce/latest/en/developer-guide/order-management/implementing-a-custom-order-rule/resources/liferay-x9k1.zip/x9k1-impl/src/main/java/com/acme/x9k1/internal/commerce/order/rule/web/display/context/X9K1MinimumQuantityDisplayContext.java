package com.acme.x9k1.internal.commerce.order.rule.web.display.context;

import com.acme.x9k1.internal.commerce.order.rule.entry.type.util.X9K1MinimumQuantityUtil;

import com.liferay.commerce.order.rule.model.COREntry;

public class X9K1MinimumQuantityDisplayContext {

	public X9K1MinimumQuantityDisplayContext(COREntry corEntry) {
		_corEntry = corEntry;
	}

	public Double getMinimumQuantity() {
		return X9K1MinimumQuantityUtil.getMinimumQuantity(_corEntry);
	}

	private final COREntry _corEntry;

}