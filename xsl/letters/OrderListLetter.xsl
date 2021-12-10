<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

<!-- BEGIN Wesleyan remove salutation END -->
				<xsl:for-each select="notification_data/letter_texts">
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>@@place_order_introduction@@:</td>
					</tr>
				</table>
				<br />

				</xsl:for-each>
				<xsl:for-each select="notification_data">
				<table>
					<tr>
						<td><b>@@order_date@@: </b> <xsl:value-of select="/notification_data/po/create_date"/></td>
					</tr>
<!-- BEGIN Wesleyan remove vendor account END -->
					<tr>
<!-- BEGIN Wesleyan include complete address -->
						<td><b>@@shipping_address@@: </b><xsl:value-of select="/notification_data/po/ship_to_address/line1"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/line2"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/line3"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/city"/>,&#160;<xsl:value-of select="/notification_data/po/ship_to_address/state_province"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/postal_code"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/country"/></td>
<!-- END Wesleyan include complete address  -->						
					</tr>
<!-- BEGIN Wesleyan remove shipping method END -->
					<tr>
<!-- BEGIN Wesleyan include complete address -->
						<td><b>@@billing_address@@: </b><xsl:value-of select="/notification_data/po/bill_to_address/line1"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/line2"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/line3"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/city"/>,&#160;<xsl:value-of select="/notification_data/po/bill_to_address/state_province"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/postal_code"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/country"/></td>
					</tr>
<!-- BEGIN Wesleyan remove erp number END -->					
				</table>
				</xsl:for-each>
				<br />


				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@po_line_number@@</th>
						<th>@@date@@</th>
						<th>@@issn_isbn@@</th>
						<th>@@title@@</th>
						<th>@@quantity@@</th>
						<th align="right">@@price@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/po/po_line_list/po_line">
					<tr>
						<td><xsl:value-of select="line_reference"/></td>
						<td><xsl:value-of select="create_date"/></td>
						<td><xsl:value-of select="identifier_type"/>&#160;<xsl:value-of select="identifier"/></td>
						<td><xsl:value-of select="meta_data_values/title"/></td>
						<td><xsl:value-of select="total_quantity"/></td>
						<td align="right"><xsl:value-of select="total_price_compose/currency"/>&#160;<xsl:value-of select="total_price_compose_with_normalized_sum/normalized_sum"/></td>
						<td><xsl:value-of select="vendor_note"/></td>
					</tr>
					</xsl:for-each>
				</table>
				<br />
<!-- BEGIN Wesleyan add vendor account  -->				
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>@@vendor_account@@</td>
					</tr>
				</table>				
<!-- END Wesleyan add vendor account -->								
				<br />
				<table>

						<tr><td>@@sincerely@@</td></tr>
<!-- BEGIN Wesleyan add contact info  -->	
						<tr><td>Acquisitions Department<br />
						<xsl:value-of select="/notification_data/organization_unit/address/line1"/><br /><xsl:value-of select="/notification_data/organization_unit/address/line2"/><br /><xsl:value-of select="/notification_data/organization_unit/address/line3"/><br /><xsl:value-of select="/notification_data/organization_unit/address/city"/>, <xsl:value-of select="/notification_data/organization_unit/address/state_province"/>&#160; <xsl:value-of select="/notification_data/organization_unit/address/postal_code"/>&#160;<xsl:value-of select="/notification_data/organization_unit/address/country"/><br />
						<xsl:value-of select="/notification_data/general_data/address_from"/>
						</td></tr>		
<!-- END Wesleyan add contact info  -->
				</table>


				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>