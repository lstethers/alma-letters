<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />

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
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->
<!-- BEGIN - Wesleyan added -->        
        <xsl:call-template name="toWhomIsConcerned" /> 
        <!-- mailReason.xsl -->
<!-- END - Wesleyan added -->
        <div class="messageArea">
          <div class="messageBody">
            <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
				<tr>
<!-- BEGIN - Wesleyan simplified -->        
					<td>@@your_request@@</td>
				</tr>
					<tr>
					<td>
						<h2><xsl:value-of select="notification_data/phys_item_display/title"/></h2>
					</td>
				</tr>
<!-- END - Wesleyan simplified -->        

				<xsl:if test="$isDigitalDocDelivery='true' or $isDeposit='false'"> <!-- DOCUMENT DELIVERY -->
<!-- BEGIN - Wesleyan simplified -->        				
<!-- END - Wesleyan simplified -->        				
					<xsl:if test="/notification_data/url_list[string]">
						<tr>
							<td>@@attached_are_the_urls@@:
<!-- BEGIN - Wesleyan formatting changes -->  							
						<xsl:for-each select="/notification_data/attachments_list/attachments">
							<xsl:if test="url">
									<br /><a>
									<xsl:attribute name="href">
										<xsl:value-of select="url" />
									</xsl:attribute>
									<xsl:value-of select="url" />
									</a>
							</xsl:if>
<!-- BEGIN - Wesleyan test whether attachment Notes field is empty LSS -->
							<xsl:if test="notes != ''">
									<br /><b>@@material@@ </b>
									<xsl:value-of select="notes" />
							</xsl:if>
						</xsl:for-each>
						<br />
<!-- BEGIN - Wesleyan add contents of patron's request note LSS -->
						<xsl:if test="/notification_data/request/note != ''">
							<br />
							<b>Your request note: </b>									<xsl:value-of select="/notification_data/request/note" />
					</xsl:if>
						</td>
						</tr>
                </xsl:if>
<!-- END - Wesleyan formatting changes -->                  
<!-- BEGIN - Wesleyan simplified --><!-- END - Wesleyan simplified --> 
                </xsl:if>	
<!-- BEGIN - Wesleyan added -->
			<tr><td>@@of@@</td></tr>		
            	<tr>
					<td>@@sincerely@@<br />@@department@@</td>
				</tr>
			<tr><td><em>Digitization does not equal copyright clearance. It is your responsibility to determine how you may legally use the digital images that you have received. For a guide to copyright and fair use, see <a><xsl:attribute name="href">http://libguides.wesleyan.edu/copyright_ip</xsl:attribute>http://libguides.wesleyan.edu/copyright_ip</a></em></td></tr>
			<tr><td><em>For permission to publish please contact Special Collections &amp; Archives (sca@wesleyan.edu) and complete the Permission to Publish form <a><xsl:attribute name="href">https://www.wesleyan.edu/libr/sca/research/Wesleyan_Permission_to_Publish.pdf</xsl:attribute>https://www.wesleyan.edu/libr/sca/research/Wesleyan_Permission_to_Publish.pdf</a></em></td></tr>
<!-- END - Wesleyan added -->			
			</table>
          </div>
        </div>
        <xsl:call-template name="lastFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
