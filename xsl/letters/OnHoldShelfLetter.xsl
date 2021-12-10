<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:template match="/">
<xsl:comment>BEGIN Wesleyan prevent sending pickup notices for ILL loans</xsl:comment>
	<xsl:if test="notification_data/phys_item_display/location_name = 'Borrowing Resource Sharing Requests'">
 		<xsl:message terminate="yes">Terminating because this is an ill item--Illiad sends the pickup notices instead</xsl:message>
	</xsl:if> 
<xsl:comment>END Wesleyan prevent sending pickup notices for ILL loans</xsl:comment>

	<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

		<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->



					<div class="messageArea">
				<div class="messageBody">
					<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>
<xsl:comment>BEGIN Wesleyan different text depending upon what pickup library</xsl:comment>
<xsl:choose>
	<xsl:when test="contains(notification_data/request/delivery_address,'Connecticut College')" >
		<p>Your requested item(s) is ready to be picked up at your home library: <strong><xsl:value-of select="notification_data/request/delivery_address"/></strong></p>
		<p>Contact your local circulation desk with any questions: <a href='http://ctw.blogs.wesleyan.edu/home/contacts/'>Library Circulation Desk contacts</a></p>
	</xsl:when>
	<xsl:when test="contains(notification_data/request/delivery_address,'Trinity College')" >
		<p>Your requested item(s) is ready to be picked up at your home library: <strong><xsl:value-of select="notification_data/request/delivery_address"/></strong></p>
		<p>Contact your local circulation desk with any questions: <a href='http://ctw.blogs.wesleyan.edu/home/contacts/'>Library Circulation Desk contacts</a></p>
	</xsl:when>
	<xsl:when test="contains(notification_data/request/delivery_address,'Digital Design Studio')" >
		<p>Your requested item(s) is ready to be picked up at the <strong><xsl:value-of select="notification_data/request/delivery_address"/></strong> (located in the Davison Art Center) during open hours. Items will remain available for pickup for 3 days.</p>
		<p>Contact Emma Fague in the Digital Design Studio with any questions: <a href='mailto:efague@wesleyan.edu'>efague@wesleyan.edu</a></p>
	</xsl:when>
	<xsl:when test="contains(notification_data/request/delivery_address,'Olin Library')" >
		<p>Your requested item(s) is ready to be picked up at Olin Library. Please note the following guidelines for your pickup:</p>
		<ul>
		<li><strong>Items are available for pickup at the Olin Reserve Desk (in left hallway after entering through front door.)</strong></li>
		<li>Items will remain available for pickup for 7 days. </li>
		</ul>
		<p>Contact the circulation desk with any questions: <a href='mailto:circ@wesleyan.edu'>circ@wesleyan.edu</a></p>
	</xsl:when>
	<xsl:when test="contains(notification_data/request/delivery_address,'Science Library')" >
		<p>Your requested item(s) is ready to be picked up at Science Library. Please note the following guidelines for your pickup:</p>
		<ul>
		<li><strong>Items are available for pickup at the Science Library circulation desk.</strong></li>
		<li>Items will remain available for pickup for 7 days. </li>
		</ul>
		<p>Contact the circulation desk with any questions: <a href='mailto:circ@wesleyan.edu'>circ@wesleyan.edu</a></p>
	</xsl:when>
	<xsl:otherwise>
		<p>Your requested item(s) is ready for pickup. Please note the following guidelines for your pickup:</p>
		<ul>
		<li>Items will remain available for pickup for 7 days. </li>
		</ul>
		<p>Contact the circulation desk with any questions: <a href='mailto:circ@wesleyan.edu'>circ@wesleyan.edu</a></p>
		</xsl:otherwise>
</xsl:choose>
<xsl:comment>END Wesleyan different text depending upon what pickup library</xsl:comment>
							</td>
						</tr>
						<tr><td><strong>Items on hold:</strong></td></tr>
						<tr>
							<td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
						</tr>
						<xsl:if test="notification_data/request/system_notes">
						<tr>
							<td>@@notes_affect_loan@@:</td>
						</tr>

						<tr>
							<td><xsl:value-of select="notification_data/request/system_notes"/></td>
						</tr>

						</xsl:if>

					</table>
				</div>
			</div>
				<br />
<xsl:comment>BEGIN Wesleyan different text depending upon what pickup library</xsl:comment>
<xsl:choose>
	<xsl:when test="contains(notification_data/request/delivery_address,'Digital Design Studio')" >
				<table role='presentation' >

						<tr><td>@@sincerely@@,</td></tr>
						<tr><td>Digital Design Studio</td></tr>

				</table>
	</xsl:when>
	<xsl:when test="contains(notification_data/request/delivery_address,'Trinity College')" >
				<table role='presentation' >

						<tr><td>@@sincerely@@,</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>

	</xsl:when>
	<xsl:when test="contains(notification_data/request/delivery_address,'Connecticut College')" >
				<table role='presentation' >

						<tr><td>@@sincerely@@,</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>

</xsl:when>
<xsl:otherwise>
				<table role='presentation' >

						<tr><td>@@sincerely@@,</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
				<xsl:call-template name="contactUs" />
</xsl:otherwise>
</xsl:choose>
<xsl:comment>END Wesleyan different text depending upon what pickup library</xsl:comment>				
			</body>
	</html>
	</xsl:template>



</xsl:stylesheet>
