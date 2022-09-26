import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentFolderResource;

public class StructuredContentFolder_GET_ById {

	/**
	 * java -classpath .:* -DstructuredContentFolderId=1234 StructuredContentFolder_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentFolderResource.Builder builder =
			StructuredContentFolderResource.builder();

		StructuredContentFolderResource structuredContentFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			structuredContentFolderResource.getStructuredContentFolder(
				Long.valueOf(System.getProperty("structuredContentFolderId"))));
	}

}