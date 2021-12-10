<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />

  <xsl:template match="/">
    <html>
      <head>
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

<!-- BEGIN - Wesleyan remove vendor name END -->
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td><b> @@introduction@@ </b>
					<br />
					<br />
					<b>@@title@@: </b><xsl:value-of select="notification_data/line/title" />
					<br />
<!-- BEGIN - Wesleyan remove reference number END -->
					<b>@@order_date@@: </b><xsl:value-of select="notification_data/line/send_date" />
					<br />
<!-- BEGIN - Wesleyan remove cancellation reason END -->
<!-- BEGIN - Wesleyan added identifier type and identifier -->
					<b><xsl:value-of select="notification_data/line/identifier_type"/></b>:  <xsl:value-of select="notification_data/line/identifier"/>
					<br />
<!-- END - Wesleyan added identifier type and identifier -->
					<b>@@cancellation_note@@: </b><xsl:value-of select="notification_data/line/cancellation_note" />
					<br />
					<br />
					</td>
				</tr>
			</table>
          </div>
        </div>
<!-- END - Wesleyan added vendor name -->        
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>@@vendor_name@@</td>
					</tr>
				</table>				
		<br />
				<table>

						<tr><td>@@sincerely@@</td></tr>
<!-- BEGIN - Wesleyan added full contact info -->   
						<tr><td>Acquisitions Department<br />
						<xsl:value-of select="/notification_data/organization_unit/address/line1"/><br /><xsl:value-of select="/notification_data/organization_unit/address/line2"/><br /><xsl:value-of select="/notification_data/organization_unit/address/line3"/><br /><xsl:value-of select="/notification_data/organization_unit/address/city"/>, <xsl:value-of select="/notification_data/organization_unit/address/state_province"/>&#160; <xsl:value-of select="/notification_data/organization_unit/address/postal_code"/>&#160;<xsl:value-of select="/notification_data/organization_unit/address/country"/><br />
						<xsl:value-of select="/notification_data/general_data/address_from"/>
						</td></tr>					
<!-- END - Wesleyan added full contact info -->   							
				</table>
		<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
