curl \
	"http://localhost:8080/o/c/applicationevaluations/batch" \
	--data-raw '
		[
			{
				"assessmentScore": {
					"key": "fair",
					"name": "Fair"
				},
				"decision": {
					"key": "approvedWithConditions",
					"name": "Approved with Conditions"
				},
				"interviewNotes": "<p>While the applicant displayed a decent understanding of the market\n	dynamics, there were some areas where they demonstrated uncertainty\n	regarding the range of products they intended to distribute. Taking\n	into account the applicant's presentation, it is essential to closely\n	assess their ability to consistently deliver exceptional customer\n	service and determine if it aligns effectively with our company's\n	values and goals before making a final decision</p>",
				"interviewNotesRawText": "While the applicant displayed a decent understanding of the market dynamics, there were some areas where they demonstrated uncertainty regarding the range of products they intended to distribute. Taking into account the applicants presentation, it is essential to closely assess their ability to consistently deliver exceptional customer service and determine if it aligns effectively with our companys values and goals before making a final decision",
				"recommendationComments": "<p>Although the applicant highlighted their previous experience in a\n	similar industry, it would be prudent to conduct further research and\n	validate the extent of their successful partnerships and the depth of\n	their network of retailers.</p>",
				"recommendationCommentsRawText": "Although the applicant highlighted their previous experience in a similar industry, it would be prudent to conduct further research and validate the extent of their successful partnerships and the depth of their network of retailers.",
				"recommendations": []
			},
			{
				"applicationToEvaluationsERC": "",
				"assessmentScore": {
					"key": "good",
					"name": "Good"
				},
				"decision": {
					"key": "approved",
					"name": "Approved"
				},
				"interviewNotes": "<p>The applicant demonstrated a strong understanding of the market\n	dynamics and displayed a comprehensive knowledge of the product range\n	they intend to distribute. The applicant's previous experience in a\n	similar industry proved to be advantageous, as they were able to\n	showcase a solid track record of successful partnerships and a\n	well-established network of retailers. Overall, the applicant's\n	presentation was well-prepared and showcased their commitment to\n	delivering exceptional customer service, which aligns with our\n	company's values and goals.</p>",
				"interviewNotesRawText": "The applicant demonstrated a strong understanding of the market dynamics and displayed a comprehensive knowledge of the product range they intend to distribute. The applicants previous experience in a similar industry proved to be advantageous, as they were able to showcase a solid track record of successful partnerships and a well-established network of retailers. Overall, the applicants presentation was well-prepared and showcased their commitment to delivering exceptional customer service, which aligns with our companys values and goals.",
				"keywords": [],
				"recommendationComments": "<p>I'd recommend moving this application forward, requesting the\n	necessary documents and scheduling a follow-up interview.</p>",
				"recommendationCommentsRawText": "Id recommend moving this application forward, requesting the necessary documents and scheduling a follow-up interview.",
				"recommendations": []
			},
			{
				"assessmentScore": {
					"key": "poor",
					"name": "Poor"
				},
				"decision": {
					"key": "rejected",
					"name": "Rejected"
				},
				"interviewNotes": "<p>The applicant's lackluster understanding of the market dynamics and\n	limited knowledge of the product range they intend to distribute were\n	significant concerns. The applicant's previous experience in a similar\n	industry was found to be questionable, as their track record of\n	successful partnerships and a well-established network of retailers\n	was not adequately supported with concrete evidence or references.\n	Based on the applicant's underwhelming presentation, it is evident\n	that their commitment to delivering exceptional customer service falls\n	significantly short of our company's expectations and standards.</p>",
				"interviewNotesRawText": "The applicants lackluster understanding of the market dynamics and limited knowledge of the product range they intend to distribute were significant concerns. The applicants previous experience in a similar industry was found to be questionable, as their track record of successful partnerships and a well-established network of retailers was not adequately supported with concrete evidence or references. Based on the applicants underwhelming presentation, it is evident that their commitment to delivering exceptional customer service falls significantly short of our companys expectations and standards.",
				"keywords": [],
				"recommendationComments": "<p>The applicant does not meet our standards.</p>",
				"recommendationCommentsRawText": "The applicant does not meet our standards.",
				"recommendations": []
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"