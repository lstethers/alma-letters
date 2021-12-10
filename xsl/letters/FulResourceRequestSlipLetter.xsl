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

			<xsl:comment>BEGIN 2021.10.25 LSS added this section for Wesleyan to prevent printing move temporarily and restore item slips, except in Music</xsl:comment>
			<!-- <xsl:if test="notification_data/request/assigned_unit_name != 'Music Library Circulation Desk'"> -->
			<xsl:if test="not(contains(notification_data/request/assigned_unit_name,'Music'))">
				<xsl:if test="notification_data/request_type = 'Move temporarily'">
			 		<xsl:message terminate="yes">Terminating because this is a move temporarily request</xsl:message>
				</xsl:if> 
				<xsl:if test="notification_data/request_type = 'Restore item'">
			 		<xsl:message terminate="yes">Terminating because this is a restore item request</xsl:message>
				</xsl:if> 	
			</xsl:if>
			<xsl:comment>END LSS added this section for Wesleyan to prevent printing move temporarily slips and restore items slips, except in Music</xsl:comment>


			<body>
			<h1>
<!-- BEGIN - 2021.02.10 LSS - whether to print patron name on the request slip - If Trinity destination library print just first three chars of last name, then primary id.  All other circumstances (Wesleyan or Conn destination) print lname, fname. -->		
<xsl:choose>
<xsl:when test="contains(notification_data/request/delivery_address,'Trinity')" >
	<h1>
		<xsl:value-of select="substring(notification_data/user_for_printing/last_name,1,3)"/> -
		<xsl:if test = "notification_data/user_for_printing/identifiers/code_value/code = 'Primary Identifier'">
			<xsl:value-of select="notification_data/user_for_printing/identifiers/code_value/value"/>
		</xsl:if>	
	</h1>
</xsl:when>
<xsl:otherwise>
							<xsl:value-of select="notification_data/user_for_printing/name"/>
</xsl:otherwise>
</xsl:choose>	
<!-- END -->
			</h1>
<!-- BEGIN - 2020.08.18 LSS added destination so we can get home address -->				
			<h3>@@move_to_library@@: <xsl:value-of select="notification_data/request/delivery_address"/></h3>
<!--
				<p>
				<xsl:if  test="notification_data/request/cause_for_recalled_item='true'" >
							Recalled item
				</xsl:if>
				</p>
-->
				<h3>@@request_type@@: <xsl:value-of select="notification_data/request_type"/></h3>
				<xsl:call-template name="head" /> <!-- header.xsl -->



			<div class="messageArea">
				<div class="messageBody">
					 <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
						<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
						<tr>
							<td><strong>@@note_item_specified_request@@.</strong></td>
						</tr>
						</xsl:if>
						<xsl:if  test="notification_data/request/manual_description != ''" >
						<tr>
							<td><strong>@@please_note@@: </strong>@@manual_description_note@@ - <xsl:value-of select="notification_data/request/manual_description"/></td>
						</tr>
						</xsl:if>
						<tr>
							<td><strong>@@request_id@@: </strong><img src="cid:request_id_barcode.png" alt="Request Barcode"/></td>
						</tr>
<!-- BEGIN - Wesleyan print barcode if it has one -->
						<xsl:if  test="notification_data/phys_item_display/available_items/available_item/barcode != ''" >
						<tr>
							<td><b>@@item_barcode@@: </b><span style="font-family:'Free 3 of 9'; font-size:36pt">*<xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/>*</span><br /><xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode"/></td>
						</tr>
						</xsl:if>
						<xsl:if  test="notification_data/external_id != ''" >
							<tr>
								<td><strong>@@external_id@@: </strong><xsl:value-of select="notification_data/external_id"/></td>
							</tr>
						</xsl:if>
<!-- BEGIN - Wesleyan removed printing user name because we did it above END -->
						<tr>
<!-- BEGIN - Wesleyan formatting -->						
							<td><h2><xsl:call-template name="recordTitle" /></h2>
<!-- END - Wesleyan formatting -->									
							</td>
						</tr>
<!-- BEGIN - Wesleyan - moved ISBN printing to the end END -->
						<tr>
							<xsl:if test="notification_data/phys_item_display/call_number != ''">
								<td><h2><strong>@@call_number@@: </strong><xsl:value-of select="notification_data/phys_item_display/call_number"/></h2></td>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/accession_number != ''">
								<td><h2><strong>@@accession_number@@: </strong><xsl:value-of select="notification_data/phys_item_display/accession_number"/></h2></td>
							</xsl:if>
						</tr>
						<tr>
							<td><h2><strong>@@location@@: </strong><xsl:value-of select="notification_data/phys_item_display/location_name"/></h2></td>
<!-- BEGIN Wesleyan added perm library -->
						</tr>
<tr><td><h2>					<b>@@permanentLibrary@@ :
							<xsl:value-of select="notification_data/organization_unit/name" />
				</b>
<!-- END Wesleyan added perm library -->
</h2></td></tr>
						<xsl:if  test="notification_data/phys_item_display/shelving_location/string" >
							<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
							<tr>
								<td><strong>@@shelving_location_for_item@@: </strong>
								 <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
									<xsl:value-of select="."/>
								 &#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
							<tr>
								<td><strong>@@shelving_locations_for_holding@@: </strong>
								<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
							<tr>
								<td><strong>@@shelving_locations_for_holding@@: </strong>
								<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
						</xsl:if>
						<xsl:if  test="notification_data/phys_item_display/display_alt_call_numbers/string" >
							<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
							<tr>
								<td><strong>@@alt_call_number@@: </strong>
								 <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
									<xsl:value-of select="."/>
								 &#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
							<tr>
								<td><strong>@@alt_call_number@@: </strong>
								<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
							<tr>
								<td><strong>@@alt_call_number@@: </strong>
								<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
						</xsl:if>
<!-- BEGIN - Wesleyan moved isbn, etc. from above -->
							<xsl:if test="notification_data/phys_item_display/isbn != ''">
								<tr>
								<td>@@isbn@@: <xsl:value-of select="notification_data/phys_item_display/isbn"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/issn != ''">
								<tr>
								<td>@@issn@@: <xsl:value-of select="notification_data/phys_item_display/issn"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/edition != ''">
								<tr>
								<td>@@edition@@: <xsl:value-of select="notification_data/phys_item_display/edition"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/imprint != ''">
								<tr>
								<td>@@imprint@@: <xsl:value-of select="notification_data/phys_item_display/imprint"/></td>
								</tr>
							</xsl:if>
<!-- END - Wesleyan moved isbn, etc. from above -->							
						<tr>
							<td><strong>@@move_to_library@@: </strong><xsl:value-of select="notification_data/destination"/></td>
						</tr>
						<tr>
							<td><strong>@@request_type@@: </strong><xsl:value-of select="notification_data/request_type"/></td>
						</tr>

						<xsl:if test="notification_data/request/system_notes != ''">
							<tr>
							<td><strong>@@system_notes@@:</strong><xsl:value-of select="notification_data/request/system_notes"/></td>
						</tr>
						</xsl:if>

						<xsl:if test="notification_data/request/note != ''">
							<tr>
							<td><strong>@@request_note@@:</strong> <xsl:value-of select="notification_data/request/note"/></td>
						</tr>
						</xsl:if>


					</table>
				</div>
			</div>




	<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->





</body>
</html>


	</xsl:template>
</xsl:stylesheet>