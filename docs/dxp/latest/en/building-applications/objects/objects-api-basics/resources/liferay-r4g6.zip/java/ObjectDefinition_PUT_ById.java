import com.liferay.object.admin.rest.client.dto.v1_0.ObjectDefinition;
import com.liferay.object.admin.rest.client.dto.v1_0.ObjectField;
import com.liferay.object.admin.rest.client.resource.v1_0.ObjectDefinitionResource;

import java.util.Collections;

public class ObjectDefinition_PUT_ById {

	/**
	 * java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		ObjectDefinitionResource.Builder builder =
			ObjectDefinitionResource.builder();

		ObjectDefinitionResource objectDefinitionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		ObjectDefinition objectDefinition =
			objectDefinitionResource.putObjectDefinition(
				Long.valueOf(System.getProperty("objectDefinitionId")),
				new ObjectDefinition() {
					{
						active = false;
						label = Collections.singletonMap("en_US", "Goo");
						name = "Goo";
						objectFields = new ObjectField[] {
							new ObjectField() {

							}
						};
						pluralLabel = Collections.singletonMap("en_US", "Goos");
						portlet = false;
						scope = "company";
					}
				});

		System.out.println(objectDefinition);
	}

}