<div class="block">
    <div class="element">
        <label>{"Default value"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
	<select name="ContentClass_ezdatetime_default_{$class_attribute.id}">
            <option value="0" {section show=eq($class_attribute.data_int1,0)}selected{/section}>{"Empty"|i18n("design/standard/class/datatype")}</option>
	    <option value="1" {section show=eq($class_attribute.data_int1,1)}selected{/section}>{"Current datetime"|i18n("design/standard/class/datatype")}</option>
            <option value="2" {section show=eq($class_attribute.data_int1,2)}selected{/section}>{"Adjusted current datetime"|i18n("design/standard/class/datatype")}</option>
	</select>
    </div>

    <div class="element">
        <label>{"Adujstment"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
        <table border="0">
	<tr>
	  <td>
	    <label>{"Year"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
	  </td>
	  <td>
	    <label>{"Month"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
	  </td>
	  <td>
	    <label>{"Day"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
	  </td>
	  <td>
	    <label>{"Hour"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
	  </td>
	  <td>
	    <label>{"Minute"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
	  </td>
	</tr>
	<tr>
	  <td>
	    <input type="text" name="ContentClass_ezdatetime_year_{$class_attribute.id}" size="5" value="{section show=$class_attribute.content.year}{$class_attribute.content.year}{/section}" />
	  </td>
	  <td>
	    <input type="text" name="ContentClass_ezdatetime_month_{$class_attribute.id}" size="3" value="{section show=$class_attribute.content.month}{$class_attribute.content.month}{/section}" />
	  </td>
	  <td>
	    <input type="text" name="ContentClass_ezdatetime_day_{$class_attribute.id}" size="3" value="{section show=$class_attribute.content.day}{$class_attribute.content.day}{/section}" />
	  </td>
	  <td>
	    <input type="text" name="ContentClass_ezdatetime_hour_{$class_attribute.id}" size="3" value="{section show=$class_attribute.content.hour}{$class_attribute.content.hour}{/section}" />
	  </td>
	  <td>
	    <input type="text" name="ContentClass_ezdatetime_minute_{$class_attribute.id}" size="3" value="{section show=$class_attribute.content.minute}{$class_attribute.content.minute}{/section}" />
	  </td>
	</tr>
	</table>
    </div>
</div>
