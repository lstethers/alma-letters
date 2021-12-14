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
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!-- header.xsl -->
<!-- BEGIN Wesleyan eliminate salutation END -->
				<div class="messageArea">
					<div class="messageBody">



						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<xsl:choose>
								<xsl:when test="notification_data/notification_type = 'NOTIFY_PASSWORD_CHANGE' ">
									<tr>
										<td>
											<h3>@@Line_1@@</h3>
											<xsl:value-of select="notification_data/temp_password" />
										</td>

									</tr>
									<tr>

										<td>
											<h3>@@Line_2@@</h3>
										</td>
									</tr>
								</xsl:when>
<!-- BEGIN Wesleyan add more letter types -->
								<xsl:when test="notification_data/notification_type = 'GRADUATING_SENIOR' ">
									<tr>
										<td>
											<p>The Library reminds you that all library items need be returned to the library by <strong>Friday, May 21, 2021</strong>.</p>
											<p>You may check your <a href="https://www.wesleyan.edu/libr/myaccount/index.html">library account</a> to see what items are currently charged out to you. For any outstanding items, please take a moment to drop off them in Olin and Science Library. </p> 
											<p>You can also return items through FedEx. The Library will cover the cost of returning items via FedEx. All that we ask you to do is to box them up safely, apply the postage-paid return label that we send you, and drop them off at your nearest FedEx shipping center. To request a postage-paid label, please fill out this form by May 20th: <a href="https://forms.gle/YHrpsnr3gePSnGNT8">https://forms.gle/YHrpsnr3gePSnGNT8</a>.</p>
											<p>
											If you have other questions about your library account, please contact the following staff members to clear your account:<br />
Randy Wilson, (<a href="mailto:rwilson@wesleyan.edu">rwilson@wesleyan.edu</a>, <a href="tel:860-685-3879">860-685-3879</a>) for collections at Olin Library <br />
Linda Hurteau (<a href="mailto:lhurteau@wesleyan.edu">lhurteau@wesleyan.edu</a>, <a href="tel:860-685-3728">860-685-3728</a>) for items at Science Library <br />
Jennifer Hadley (<a href="mailto:jthom@wesleyan.edu">jthom@wesleyan.edu</a>, <a href="tel:860-685-3897">860-685-3897</a>) for items at Music Library <br />
Kate Wolfe (<a href="mailto:ill@wesleyan.edu">ill@wesleyan.edu</a>, <a href="tel:860-685-3876">860-685-3876</a>) for items from Interlibrary Loan department <br />
Chris Chenier (<a href="mailto:cchenier@wesleyan.edu">cchenier@wesleyan.edu</a>, <a href="tel:860-685-2612">860-685-2612</a>) for items from Digital Design Studio <br />
											</p>
											<p>Thank you for returning the library items by May 21, 2021.</p>
											<p>Congratulations on your forthcoming graduation and best wishes in your future endeavors.</p>
											</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'EMERGENCY_NOTIFICATION' ">
									<tr>
										<td>
<p>The Library is currently offering a home delivery service to students registered for remote courses.  If you would like to borrow books from the Library, you may request the titles from the Library’s <a href="http://onesearch.wesleyan.edu">OneSearch</a> using the request option, then choose Home Delivery. We will then ship out books to your home address via FedEx. </p>
<p>If you have any questions about this home delivery service, please contact the Library at <a href='mailto:circ@wesleyan.edu'>circ@wesleyan.edu</a></p>
<p> All the best for the fall 2020 semester.</p>
											</td>
									</tr>
								</xsl:when>
<!-- END Wesleyan add more letter types -->
							</xsl:choose>
						</table>
						<br />
						<table role='presentation' >

							<tr>
<!-- BEGIN Wesleyan change signature -->
									<td>
<p>EunJoo Lee<br />
Head of Access Services | <a href="https://www.wesleyan.edu/libr/">Olin Library</a><br/>
Wesleyan University | 252 Church St. | Middletown, CT 06459<br />
P. 860 685-3454 | F. 860 685-2661</p></td>
								</tr>
<!-- END Wesleyan change signature -->
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
<!-- BEGIN Wesleyan add account link -->
				<xsl:call-template name="myAccount" />
<!-- END Wesleyan add account link -->				
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
