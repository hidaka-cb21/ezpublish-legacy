<form method="post" action={concat( $module.functions.edit.uri, '/', $role.id, '/' )|ezurl}>

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'Create a new policy for the <%role_name> role'|i18n( 'design/admin/role/createpolicystep3',, hash( '%role_name', $role.name ) )|wash}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

<p>
{'Welcome to the policy wizard. This three step wizard will help you set up a new policy. The policy will be added to the role that is currently being edited. The wizard can be aborted at any stage by using the "Cancel" button.'|i18n( 'design/admin/role/createpolicystep3' )}
</p>

<hr />

<h2>{'Step one: select module [completed]'|i18n( 'design/admin/role/createpolicystep3' )}</h2>

<div class="block">
<label>{'Selected module'|i18n( 'design/admin/role/createpolicystep3' )}</label>
{section show=$current_module|eq( '*' )}
{'All modules'|i18n( 'design/admin/role/createpolicystep3' )}
{section-else}
{$current_module|upfirst()}
{/section}
</div>

<div class="block">
<label>{'Selected access method'|i18n( 'design/admin/role/createpolicystep3' )}</label>
{'Limited'|i18n( 'design/admin/role/createpolicystep3' )}
</div>

<hr />

<h2>{'Step two: select function [completed]'|i18n( 'design/admin/role/createpolicystep3' )}</h2>

<div class="block">
<label>{'Selected function'|i18n( 'design/admin/role/createpolicystep3' )}</label>
{$current_function|upfirst()}
</div>

<div class="block">
<label>{'Selected access method'|i18n( 'design/admin/role/createpolicystep3' )}</label>
{'Limited'|i18n( 'design/admin/role/createpolicystep3' )}
</div>

<hr />

<h2>{'Step three: set function limitations'|i18n( 'design/admin/role/createpolicystep3' )}</h2>

<p>
{'Instructions'|i18n( 'design/admin/role/createpolicystep3' )}:
</p>
<ol>
<li>{'Set the desired function limitations using the controls below.'|i18n( 'design/admin/role/createpolicystep3' )}</li>
<li>{'Click the "OK" button to finish the wizard. The policy will be added to the role that is currently being edited.'|i18n( 'design/admin/role/createpolicystep3' )}</li>
</ol>

<div class="block">
{section name=Limitations loop=$function_limitations}
{section-exclude match=$Limitations:item.name|eq('Subtree')}
{section-exclude match=$Limitations:item.name|eq('Node')}
{section show=$function_limitations|count|gt(1)}
<div class="element">
{/section}
<label>{$Limitations:item.name}</label>
<select name="{$Limitations:item.name}[]" size="8" multiple="multiple" >
<option value="-1" {switch match=$current_limitation_list[$Limitations:item.name]}
{case match=-1} selected="selected"{/case}{case}{/case}{/switch}>{'Any'|i18n( 'design/admin/role/createpolicystep3' )}</option>
{section name=LimitationValues loop=$Limitations:item.values}
<option value="{$Limitations:LimitationValues:item.value}" {switch match=$Limitations:LimitationValues:item.value}
{case in=$current_limitation_list[$Limitations:item.name]}selected="selected"{/case}{case}{/case}{/switch}>{$Limitations:LimitationValues:item.Name}</option>
{/section}
</select>
{section show=$function_limitations|count|gt(1)}
</div>
{/section}
{/section}
</div>


{section var=Limitations loop=$function_limitations}

{switch match=$Limitations.item.name}

{* Nodes *}
{case match="Node"}
<div class="block">
<fieldset>
<legend>{'Nodes [%node_count]'|i18n( 'design/admin/role/createpolicystep3',, hash( '%node_count', $node_list|count ) )}</legend>
{section show=$node_list}
<table class="list" cellspacing="0">
<tr>
<th class="tight">&nbsp;</th>
<th>{'Name'|i18n( 'design/admin/role/createpolicystep3' )}</th>
</tr>
{section var=Nodes loop=$node_list sequence=array( bglight, bgdark )}
<tr class="{$Nodes.sequence}">
<td><input type="checkbox" name="DeleteNodeIDArray[]" value="{$Nodes.item.node_id}" /></td>
<td>{$Nodes.item.name}</td>
</tr>
{/section}
</table>
{section-else}
<p>
{'The node list is empty.'|i18n( 'design/admin/role/createpolicystep3' )}
</p>
{/section}
{section show=$node_list}
<input class="button" type="submit" name="DeleteNodeButton" value="{'Remove selected'|i18n( 'design/admin/role/createpolicystep3' )}" />
{section-else}
<input class="button-disabled" type="submit" name="DeleteNodeButton" value="{'Remove selected'|i18n( 'design/admin/role/createpolicystep3' )}" disabled="disabled" />
{/section}

<input class="button" type="submit" name="BrowseLimitationNodeButton" value="{'Add nodes'|i18n( 'design/admin/role/createpolicystep3' )}" />
</fieldset>
</div>
{/case}

{* Subtrees *}
{case match="Subtree"}
<div class="block">
<fieldset>
<legend>{'Subtrees [%subtree_count]'|i18n( 'design/admin/role/createpolicystep3',, hash( '%subtree_count', $subtree_list|count ) )}</legend>
{section show=$subtree_list}
<table class="list" cellspacing="0">
<tr>
<th class="tight">&nbsp;</th>
<th>{'Subtree'|i18n( 'design/admin/role/createpolicystep3' )}</th>
</tr>
{section var=Subtrees loop=$subtree_list sequence=array( bglight, bgdark )}
<tr class="{$Subtrees.sequence}">
<td><input type="checkbox" name="DeleteSubtreeIDArray[]" value="{$Subtrees.item.node_id}" /></td>
<td>{$Subtrees.item.name}</td>
</tr>
{/section}
</table>
{section-else}
<p>{'The subtree list is empty.'|i18n( 'design/admin/role/createpolicystep3' )}</p>
{/section}

{section show=$subtree_list}
<input class="button" type="submit" name="DeleteSubtreeButton" value="{'Remove selected'|i18n( 'design/admin/role/createpolicystep3' )}" />
{section-else}
<input class="button-disabled" type="submit" name="DeleteSubtreeButton" value="{'Remove selected'|i18n( 'design/admin/role/createpolicystep3' )}" disabled="disabled" />
{/section}

<input class="button" type="submit" name="BrowseLimitationSubtreeButton" value="{'Add subtrees'|i18n( 'design/admin/role/createpolicystep3' )}" />
</fieldset>
</div>
{/case}

{case}
{/case}

{/switch}

{/section}

<hr />

<div class="block">
<input class="button" type="submit" name="Step1" value="{'Go back to step one'|i18n( 'design/admin/role/createpolicystep3' )}" />
<input class="button" type="submit" name="Step2" value="{'Go back to step two'|i18n( 'design/admin/role/createpolicystep3' )}" />
</div>

</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
<input type="hidden" name="CurrentModule" value="{$current_module}" />
<input type="hidden" name="CurrentFunction" value="{$current_function}" />
<input class="button" type="submit" name="AddLimitation" value="{'OK'|i18n( 'design/admin/role/createpolicystep3' )}" />
<input class="button" type="submit" name="Cancel" value="{'Cancel'|i18n( 'design/admin/role/createpolicystep3' )}" />
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>

</form>
