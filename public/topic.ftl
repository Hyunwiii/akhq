<#-- @ftlvariable name="clusterId" type="java.lang.String" -->
<#-- @ftlvariable name="topic" type="org.kafkahq.models.Topic" -->
<#-- @ftlvariable name="configs" type="java.util.ArrayList<org.kafkahq.models.Config>" -->
<#-- @ftlvariable name="tab" type="java.lang.String" -->
<#-- @ftlvariable name="basePath" type="java.lang.String" -->

<#import "/includes/template.ftl" as template>
<#import "/includes/group.ftl" as groupTemplate>

<@template.header "Topic: " + topic.getName(), "topic" />

<div class="tabs-container invisible">
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a class="nav-link ${(tab == "data")?then("active", "")}"
               href="${basePath}/${clusterId}/topic/${topic.getName()}"
               role="tab">Data</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${(tab == "partitions")?then("active", "")}"
               href="${basePath}/${clusterId}/topic/${topic.getName()}/partitions"
               role="tab">Partitions</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${(tab == "groups")?then("active", "")}"
               href="${basePath}/${clusterId}/topic/${topic.getName()}/groups"
               role="tab">Consumer Groups</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${(tab == "configs")?then("active", "")}"
               href="${basePath}/${clusterId}/topic/${topic.getName()}/configs"
               role="tab">Configs</a>
        </li>
    </ul>

    <div class="tab-content">
        <#if tab == "data">
        <div class="tab-pane active" role="tabpanel">
            <#include "/blocks/topic/data.ftl" />
        </div>
        </#if>

        <#if tab == "partitions">
        <div class="tab-pane active" role="tabpanel">
            <#include "/blocks/topic/partitions.ftl" />
        </div>
        </#if>

        <#if tab == "groups">
        <div class="tab-pane active" role="tabpanel">
            <@groupTemplate.table topic.getConsumerGroups() />
        </div>
        </#if>

        <#if tab == "configs">
        <div class="tab-pane active" role="tabpanel">
            <#include "/blocks/configs.ftl" />
        </div>
        </#if>
    </div>
</div>


<@template.footer/>

