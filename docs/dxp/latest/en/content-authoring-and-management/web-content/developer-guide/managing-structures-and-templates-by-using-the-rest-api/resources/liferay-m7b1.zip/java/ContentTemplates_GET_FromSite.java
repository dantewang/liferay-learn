import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.ContentTemplateResource;

public class ContentTemplates_GET_FromSite {

	/**
	 * java -classpath .:* -DsiteId=1234 ContentTemplates_GET_FromSite
	 */
	public static void main(String[] args) throws Exception {
		ContentTemplateResource.Builder builder =
			ContentTemplateResource.builder();

		ContentTemplateResource contentTemplateResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			contentTemplateResource.getSiteContentTemplatesPage(
				Long.parseLong(System.getProperty("siteId")), null, null, null,
				Pagination.of(1, 2), null));
	}

}