import com.liferay.headless.commerce.admin.catalog.client.resource.v1_0.SpecificationResource;

public class Specification_DELETE_ById {

	/**
	 * java -classpath .:* -DspecificationId=1234 Specification_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		SpecificationResource.Builder builder = SpecificationResource.builder();

		SpecificationResource specificationResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		specificationResource.deleteSpecification(
			Long.valueOf(System.getProperty("specificationId")));
	}

}