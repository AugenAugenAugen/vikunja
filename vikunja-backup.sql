--
-- PostgreSQL database dump
--

\restrict WVjPAQvcf1xeWy860qpFVAw4KC5nPc7RYzhwYrtIcxxaO2TG6ocElyiuMxYsZPc

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP INDEX IF EXISTS public."UQE_webhooks_id";
DROP INDEX IF EXISTS public."UQE_users_username";
DROP INDEX IF EXISTS public."UQE_users_projects_id";
DROP INDEX IF EXISTS public."UQE_users_id";
DROP INDEX IF EXISTS public."UQE_user_tokens_id";
DROP INDEX IF EXISTS public."UQE_unsplash_photos_id";
DROP INDEX IF EXISTS public."UQE_totp_id";
DROP INDEX IF EXISTS public."UQE_teams_id";
DROP INDEX IF EXISTS public."UQE_team_projects_id";
DROP INDEX IF EXISTS public."UQE_team_members_id";
DROP INDEX IF EXISTS public."UQE_tasks_id";
DROP INDEX IF EXISTS public."UQE_task_unread_statuses_task_user";
DROP INDEX IF EXISTS public."UQE_task_reminders_id";
DROP INDEX IF EXISTS public."UQE_task_relations_id";
DROP INDEX IF EXISTS public."UQE_task_comments_id";
DROP INDEX IF EXISTS public."UQE_task_buckets_task_view";
DROP INDEX IF EXISTS public."UQE_task_attachments_id";
DROP INDEX IF EXISTS public."UQE_task_assignees_id";
DROP INDEX IF EXISTS public."UQE_subscriptions_id";
DROP INDEX IF EXISTS public."UQE_saved_filters_id";
DROP INDEX IF EXISTS public."UQE_reactions_id";
DROP INDEX IF EXISTS public."UQE_projects_id";
DROP INDEX IF EXISTS public."UQE_project_views_id";
DROP INDEX IF EXISTS public."UQE_notifications_id";
DROP INDEX IF EXISTS public."UQE_migration_status_id";
DROP INDEX IF EXISTS public."UQE_link_shares_id";
DROP INDEX IF EXISTS public."UQE_link_shares_hash";
DROP INDEX IF EXISTS public."UQE_labels_id";
DROP INDEX IF EXISTS public."UQE_label_tasks_id";
DROP INDEX IF EXISTS public."UQE_files_id";
DROP INDEX IF EXISTS public."UQE_buckets_id";
DROP INDEX IF EXISTS public."UQE_api_tokens_token_hash";
DROP INDEX IF EXISTS public."UQE_api_tokens_id";
DROP INDEX IF EXISTS public."IDX_webhooks_project_id";
DROP INDEX IF EXISTS public."IDX_users_projects_user_id";
DROP INDEX IF EXISTS public."IDX_users_projects_project_id";
DROP INDEX IF EXISTS public."IDX_users_projects_permission";
DROP INDEX IF EXISTS public."IDX_users_overdue_tasks_reminders_enabled";
DROP INDEX IF EXISTS public."IDX_users_discoverable_by_name";
DROP INDEX IF EXISTS public."IDX_users_discoverable_by_email";
DROP INDEX IF EXISTS public."IDX_users_default_project_id";
DROP INDEX IF EXISTS public."IDX_user_tokens_token";
DROP INDEX IF EXISTS public."IDX_teams_created_by_id";
DROP INDEX IF EXISTS public."IDX_team_projects_team_id";
DROP INDEX IF EXISTS public."IDX_team_projects_project_id";
DROP INDEX IF EXISTS public."IDX_team_projects_permission";
DROP INDEX IF EXISTS public."IDX_team_members_user_id";
DROP INDEX IF EXISTS public."IDX_team_members_team_id";
DROP INDEX IF EXISTS public."IDX_tasks_start_date";
DROP INDEX IF EXISTS public."IDX_tasks_repeat_after";
DROP INDEX IF EXISTS public."IDX_tasks_project_id";
DROP INDEX IF EXISTS public."IDX_tasks_end_date";
DROP INDEX IF EXISTS public."IDX_tasks_due_date";
DROP INDEX IF EXISTS public."IDX_tasks_done_at";
DROP INDEX IF EXISTS public."IDX_tasks_done";
DROP INDEX IF EXISTS public."IDX_task_reminders_task_id";
DROP INDEX IF EXISTS public."IDX_task_reminders_reminder";
DROP INDEX IF EXISTS public."IDX_task_positions_task_id";
DROP INDEX IF EXISTS public."IDX_task_positions_project_view_id";
DROP INDEX IF EXISTS public."IDX_task_comments_task_id";
DROP INDEX IF EXISTS public."IDX_task_buckets_task_id";
DROP INDEX IF EXISTS public."IDX_task_buckets_project_view_id";
DROP INDEX IF EXISTS public."IDX_task_buckets_bucket_id";
DROP INDEX IF EXISTS public."IDX_task_assignees_user_id";
DROP INDEX IF EXISTS public."IDX_task_assignees_task_id";
DROP INDEX IF EXISTS public."IDX_subscriptions_user_id";
DROP INDEX IF EXISTS public."IDX_subscriptions_entity_type";
DROP INDEX IF EXISTS public."IDX_subscriptions_entity_id";
DROP INDEX IF EXISTS public."IDX_saved_filters_owner_id";
DROP INDEX IF EXISTS public."IDX_reactions_value";
DROP INDEX IF EXISTS public."IDX_reactions_user_id";
DROP INDEX IF EXISTS public."IDX_reactions_entity_kind";
DROP INDEX IF EXISTS public."IDX_reactions_entity_id";
DROP INDEX IF EXISTS public."IDX_projects_parent_project_id";
DROP INDEX IF EXISTS public."IDX_projects_owner_id";
DROP INDEX IF EXISTS public."IDX_project_views_project_id";
DROP INDEX IF EXISTS public."IDX_project_views_done_bucket_id";
DROP INDEX IF EXISTS public."IDX_project_views_default_bucket_id";
DROP INDEX IF EXISTS public."IDX_notifications_name";
DROP INDEX IF EXISTS public."IDX_link_shares_sharing_type";
DROP INDEX IF EXISTS public."IDX_link_shares_shared_by_id";
DROP INDEX IF EXISTS public."IDX_link_shares_permission";
DROP INDEX IF EXISTS public."IDX_label_tasks_task_id";
DROP INDEX IF EXISTS public."IDX_label_tasks_label_id";
DROP INDEX IF EXISTS public."IDX_api_tokens_token_last_eight";
ALTER TABLE IF EXISTS ONLY public.webhooks DROP CONSTRAINT IF EXISTS webhooks_pkey;
ALTER TABLE IF EXISTS ONLY public.users_projects DROP CONSTRAINT IF EXISTS users_projects_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.user_tokens DROP CONSTRAINT IF EXISTS user_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.unsplash_photos DROP CONSTRAINT IF EXISTS unsplash_photos_pkey;
ALTER TABLE IF EXISTS ONLY public.totp DROP CONSTRAINT IF EXISTS totp_pkey;
ALTER TABLE IF EXISTS ONLY public.teams DROP CONSTRAINT IF EXISTS teams_pkey;
ALTER TABLE IF EXISTS ONLY public.team_projects DROP CONSTRAINT IF EXISTS team_projects_pkey;
ALTER TABLE IF EXISTS ONLY public.team_members DROP CONSTRAINT IF EXISTS team_members_pkey;
ALTER TABLE IF EXISTS ONLY public.tasks DROP CONSTRAINT IF EXISTS tasks_pkey;
ALTER TABLE IF EXISTS ONLY public.task_reminders DROP CONSTRAINT IF EXISTS task_reminders_pkey;
ALTER TABLE IF EXISTS ONLY public.task_relations DROP CONSTRAINT IF EXISTS task_relations_pkey;
ALTER TABLE IF EXISTS ONLY public.task_comments DROP CONSTRAINT IF EXISTS task_comments_pkey;
ALTER TABLE IF EXISTS ONLY public.task_attachments DROP CONSTRAINT IF EXISTS task_attachments_pkey;
ALTER TABLE IF EXISTS ONLY public.task_assignees DROP CONSTRAINT IF EXISTS task_assignees_pkey;
ALTER TABLE IF EXISTS ONLY public.subscriptions DROP CONSTRAINT IF EXISTS subscriptions_pkey;
ALTER TABLE IF EXISTS ONLY public.saved_filters DROP CONSTRAINT IF EXISTS saved_filters_pkey;
ALTER TABLE IF EXISTS ONLY public.reactions DROP CONSTRAINT IF EXISTS reactions_pkey;
ALTER TABLE IF EXISTS ONLY public.projects DROP CONSTRAINT IF EXISTS projects_pkey;
ALTER TABLE IF EXISTS ONLY public.project_views DROP CONSTRAINT IF EXISTS project_views_pkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.migration_status DROP CONSTRAINT IF EXISTS migration_status_pkey;
ALTER TABLE IF EXISTS ONLY public.link_shares DROP CONSTRAINT IF EXISTS link_shares_pkey;
ALTER TABLE IF EXISTS ONLY public.labels DROP CONSTRAINT IF EXISTS labels_pkey;
ALTER TABLE IF EXISTS ONLY public.label_tasks DROP CONSTRAINT IF EXISTS label_tasks_pkey;
ALTER TABLE IF EXISTS ONLY public.files DROP CONSTRAINT IF EXISTS files_pkey;
ALTER TABLE IF EXISTS ONLY public.favorites DROP CONSTRAINT IF EXISTS favorites_pkey;
ALTER TABLE IF EXISTS ONLY public.buckets DROP CONSTRAINT IF EXISTS buckets_pkey;
ALTER TABLE IF EXISTS ONLY public.api_tokens DROP CONSTRAINT IF EXISTS api_tokens_pkey;
ALTER TABLE IF EXISTS public.webhooks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.users_projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.unsplash_photos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.totp ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.teams ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.team_projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.team_members ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tasks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.task_reminders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.task_relations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.task_comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.task_attachments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.task_assignees ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.subscriptions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.saved_filters ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.reactions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.project_views ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.notifications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.migration_status ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.link_shares ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.labels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.label_tasks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.files ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.buckets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.api_tokens ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.webhooks_id_seq;
DROP TABLE IF EXISTS public.webhooks;
DROP SEQUENCE IF EXISTS public.users_projects_id_seq;
DROP TABLE IF EXISTS public.users_projects;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.user_tokens_id_seq;
DROP TABLE IF EXISTS public.user_tokens;
DROP SEQUENCE IF EXISTS public.unsplash_photos_id_seq;
DROP TABLE IF EXISTS public.unsplash_photos;
DROP TABLE IF EXISTS public.typesense_sync;
DROP SEQUENCE IF EXISTS public.totp_id_seq;
DROP TABLE IF EXISTS public.totp;
DROP SEQUENCE IF EXISTS public.teams_id_seq;
DROP TABLE IF EXISTS public.teams;
DROP SEQUENCE IF EXISTS public.team_projects_id_seq;
DROP TABLE IF EXISTS public.team_projects;
DROP SEQUENCE IF EXISTS public.team_members_id_seq;
DROP TABLE IF EXISTS public.team_members;
DROP SEQUENCE IF EXISTS public.tasks_id_seq;
DROP TABLE IF EXISTS public.tasks;
DROP TABLE IF EXISTS public.task_unread_statuses;
DROP SEQUENCE IF EXISTS public.task_reminders_id_seq;
DROP TABLE IF EXISTS public.task_reminders;
DROP SEQUENCE IF EXISTS public.task_relations_id_seq;
DROP TABLE IF EXISTS public.task_relations;
DROP TABLE IF EXISTS public.task_positions;
DROP SEQUENCE IF EXISTS public.task_comments_id_seq;
DROP TABLE IF EXISTS public.task_comments;
DROP TABLE IF EXISTS public.task_buckets;
DROP SEQUENCE IF EXISTS public.task_attachments_id_seq;
DROP TABLE IF EXISTS public.task_attachments;
DROP SEQUENCE IF EXISTS public.task_assignees_id_seq;
DROP TABLE IF EXISTS public.task_assignees;
DROP SEQUENCE IF EXISTS public.subscriptions_id_seq;
DROP TABLE IF EXISTS public.subscriptions;
DROP SEQUENCE IF EXISTS public.saved_filters_id_seq;
DROP TABLE IF EXISTS public.saved_filters;
DROP SEQUENCE IF EXISTS public.reactions_id_seq;
DROP TABLE IF EXISTS public.reactions;
DROP SEQUENCE IF EXISTS public.projects_id_seq;
DROP TABLE IF EXISTS public.projects;
DROP SEQUENCE IF EXISTS public.project_views_id_seq;
DROP TABLE IF EXISTS public.project_views;
DROP SEQUENCE IF EXISTS public.notifications_id_seq;
DROP TABLE IF EXISTS public.notifications;
DROP SEQUENCE IF EXISTS public.migration_status_id_seq;
DROP TABLE IF EXISTS public.migration_status;
DROP TABLE IF EXISTS public.migration;
DROP SEQUENCE IF EXISTS public.link_shares_id_seq;
DROP TABLE IF EXISTS public.link_shares;
DROP SEQUENCE IF EXISTS public.labels_id_seq;
DROP TABLE IF EXISTS public.labels;
DROP SEQUENCE IF EXISTS public.label_tasks_id_seq;
DROP TABLE IF EXISTS public.label_tasks;
DROP SEQUENCE IF EXISTS public.files_id_seq;
DROP TABLE IF EXISTS public.files;
DROP TABLE IF EXISTS public.favorites;
DROP SEQUENCE IF EXISTS public.buckets_id_seq;
DROP TABLE IF EXISTS public.buckets;
DROP SEQUENCE IF EXISTS public.api_tokens_id_seq;
DROP TABLE IF EXISTS public.api_tokens;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_tokens; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.api_tokens (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    token_salt character varying(255) NOT NULL,
    token_hash character varying(255) NOT NULL,
    token_last_eight character varying(8) NOT NULL,
    permissions json NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE public.api_tokens OWNER TO vikunja;

--
-- Name: api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.api_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_tokens_id_seq OWNER TO vikunja;

--
-- Name: api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.api_tokens_id_seq OWNED BY public.api_tokens.id;


--
-- Name: buckets; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.buckets (
    id bigint NOT NULL,
    title text NOT NULL,
    project_view_id bigint NOT NULL,
    "limit" bigint DEFAULT 0,
    "position" double precision,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    created_by_id bigint NOT NULL
);


ALTER TABLE public.buckets OWNER TO vikunja;

--
-- Name: buckets_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.buckets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buckets_id_seq OWNER TO vikunja;

--
-- Name: buckets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.buckets_id_seq OWNED BY public.buckets.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.favorites (
    entity_id bigint NOT NULL,
    user_id bigint NOT NULL,
    kind integer NOT NULL
);


ALTER TABLE public.favorites OWNER TO vikunja;

--
-- Name: files; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.files (
    id bigint NOT NULL,
    name text NOT NULL,
    mime text,
    size bigint NOT NULL,
    created timestamp without time zone,
    created_by_id bigint NOT NULL
);


ALTER TABLE public.files OWNER TO vikunja;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO vikunja;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: label_tasks; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.label_tasks (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    label_id bigint NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.label_tasks OWNER TO vikunja;

--
-- Name: label_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.label_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_tasks_id_seq OWNER TO vikunja;

--
-- Name: label_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.label_tasks_id_seq OWNED BY public.label_tasks.id;


--
-- Name: labels; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.labels (
    id bigint NOT NULL,
    title character varying(250) NOT NULL,
    description text,
    hex_color character varying(6),
    created_by_id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.labels OWNER TO vikunja;

--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labels_id_seq OWNER TO vikunja;

--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.labels_id_seq OWNED BY public.labels.id;


--
-- Name: link_shares; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.link_shares (
    id bigint NOT NULL,
    hash character varying(40) NOT NULL,
    name text,
    project_id bigint NOT NULL,
    permission bigint DEFAULT 0 NOT NULL,
    sharing_type bigint DEFAULT 0 NOT NULL,
    password text,
    shared_by_id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.link_shares OWNER TO vikunja;

--
-- Name: link_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.link_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_shares_id_seq OWNER TO vikunja;

--
-- Name: link_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.link_shares_id_seq OWNED BY public.link_shares.id;


--
-- Name: migration; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.migration (
    id character varying(255),
    description character varying(255)
);


ALTER TABLE public.migration OWNER TO vikunja;

--
-- Name: migration_status; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.migration_status (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    migrator_name character varying(255),
    started_at timestamp without time zone NOT NULL,
    finished_at timestamp without time zone
);


ALTER TABLE public.migration_status OWNER TO vikunja;

--
-- Name: migration_status_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.migration_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migration_status_id_seq OWNER TO vikunja;

--
-- Name: migration_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.migration_status_id_seq OWNED BY public.migration_status.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    notifiable_id bigint NOT NULL,
    notification json NOT NULL,
    name character varying(250) NOT NULL,
    subject_id bigint,
    read_at timestamp without time zone,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO vikunja;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO vikunja;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: project_views; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.project_views (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    project_id bigint NOT NULL,
    view_kind integer NOT NULL,
    filter json,
    "position" double precision,
    bucket_configuration_mode integer DEFAULT 0,
    bucket_configuration json,
    default_bucket_id bigint,
    done_bucket_id bigint,
    updated timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.project_views OWNER TO vikunja;

--
-- Name: project_views_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.project_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_views_id_seq OWNER TO vikunja;

--
-- Name: project_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.project_views_id_seq OWNED BY public.project_views.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    title character varying(250) NOT NULL,
    description text,
    identifier character varying(10),
    hex_color character varying(6),
    owner_id bigint NOT NULL,
    parent_project_id bigint,
    is_archived boolean DEFAULT false NOT NULL,
    background_file_id bigint,
    background_blur_hash character varying(50),
    "position" double precision,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO vikunja;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO vikunja;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: reactions; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.reactions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    entity_id bigint NOT NULL,
    entity_kind bigint NOT NULL,
    value character varying(20) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.reactions OWNER TO vikunja;

--
-- Name: reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reactions_id_seq OWNER TO vikunja;

--
-- Name: reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.reactions_id_seq OWNED BY public.reactions.id;


--
-- Name: saved_filters; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.saved_filters (
    id bigint NOT NULL,
    filters json NOT NULL,
    title character varying(250) NOT NULL,
    description text,
    owner_id bigint NOT NULL,
    is_favorite boolean DEFAULT false,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.saved_filters OWNER TO vikunja;

--
-- Name: saved_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.saved_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_filters_id_seq OWNER TO vikunja;

--
-- Name: saved_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.saved_filters_id_seq OWNED BY public.saved_filters.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    entity_type integer NOT NULL,
    entity_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO vikunja;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO vikunja;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: task_assignees; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_assignees (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.task_assignees OWNER TO vikunja;

--
-- Name: task_assignees_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.task_assignees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_assignees_id_seq OWNER TO vikunja;

--
-- Name: task_assignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.task_assignees_id_seq OWNED BY public.task_assignees.id;


--
-- Name: task_attachments; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_attachments (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    file_id bigint NOT NULL,
    created_by_id bigint NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.task_attachments OWNER TO vikunja;

--
-- Name: task_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.task_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_attachments_id_seq OWNER TO vikunja;

--
-- Name: task_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.task_attachments_id_seq OWNED BY public.task_attachments.id;


--
-- Name: task_buckets; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_buckets (
    bucket_id bigint NOT NULL,
    task_id bigint NOT NULL,
    project_view_id bigint NOT NULL
);


ALTER TABLE public.task_buckets OWNER TO vikunja;

--
-- Name: task_comments; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_comments (
    id bigint NOT NULL,
    comment text NOT NULL,
    author_id bigint NOT NULL,
    task_id bigint NOT NULL,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.task_comments OWNER TO vikunja;

--
-- Name: task_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.task_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_comments_id_seq OWNER TO vikunja;

--
-- Name: task_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.task_comments_id_seq OWNED BY public.task_comments.id;


--
-- Name: task_positions; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_positions (
    task_id bigint NOT NULL,
    project_view_id bigint NOT NULL,
    "position" double precision NOT NULL
);


ALTER TABLE public.task_positions OWNER TO vikunja;

--
-- Name: task_relations; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_relations (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    other_task_id bigint NOT NULL,
    relation_kind character varying(50) NOT NULL,
    created_by_id bigint NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.task_relations OWNER TO vikunja;

--
-- Name: task_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.task_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_relations_id_seq OWNER TO vikunja;

--
-- Name: task_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.task_relations_id_seq OWNED BY public.task_relations.id;


--
-- Name: task_reminders; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_reminders (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    reminder timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    relative_period bigint,
    relative_to character varying(50)
);


ALTER TABLE public.task_reminders OWNER TO vikunja;

--
-- Name: task_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.task_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_reminders_id_seq OWNER TO vikunja;

--
-- Name: task_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.task_reminders_id_seq OWNED BY public.task_reminders.id;


--
-- Name: task_unread_statuses; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.task_unread_statuses (
    task_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.task_unread_statuses OWNER TO vikunja;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    title text NOT NULL,
    description text,
    done boolean,
    done_at timestamp without time zone,
    due_date timestamp without time zone,
    project_id bigint NOT NULL,
    repeat_after bigint,
    repeat_mode integer DEFAULT 0 NOT NULL,
    priority bigint,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    hex_color character varying(6),
    percent_done double precision,
    index bigint DEFAULT 0 NOT NULL,
    uid character varying(250),
    cover_image_attachment_id bigint DEFAULT 0,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    created_by_id bigint NOT NULL
);


ALTER TABLE public.tasks OWNER TO vikunja;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO vikunja;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: team_members; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.team_members (
    id bigint NOT NULL,
    team_id bigint NOT NULL,
    user_id bigint NOT NULL,
    admin boolean,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.team_members OWNER TO vikunja;

--
-- Name: team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.team_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_members_id_seq OWNER TO vikunja;

--
-- Name: team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.team_members_id_seq OWNED BY public.team_members.id;


--
-- Name: team_projects; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.team_projects (
    id bigint NOT NULL,
    team_id bigint NOT NULL,
    project_id bigint NOT NULL,
    permission bigint DEFAULT 0 NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.team_projects OWNER TO vikunja;

--
-- Name: team_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.team_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_projects_id_seq OWNER TO vikunja;

--
-- Name: team_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.team_projects_id_seq OWNED BY public.team_projects.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    description text,
    created_by_id bigint NOT NULL,
    external_id character varying(250),
    issuer text,
    created timestamp without time zone,
    updated timestamp without time zone,
    is_public boolean DEFAULT false NOT NULL
);


ALTER TABLE public.teams OWNER TO vikunja;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO vikunja;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: totp; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.totp (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    secret text NOT NULL,
    enabled boolean,
    url text
);


ALTER TABLE public.totp OWNER TO vikunja;

--
-- Name: totp_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.totp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.totp_id_seq OWNER TO vikunja;

--
-- Name: totp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.totp_id_seq OWNED BY public.totp.id;


--
-- Name: typesense_sync; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.typesense_sync (
    collection character varying(255) NOT NULL,
    sync_started_at timestamp without time zone NOT NULL,
    sync_finished_at timestamp without time zone
);


ALTER TABLE public.typesense_sync OWNER TO vikunja;

--
-- Name: unsplash_photos; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.unsplash_photos (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    unsplash_id character varying(50),
    author text,
    author_name text
);


ALTER TABLE public.unsplash_photos OWNER TO vikunja;

--
-- Name: unsplash_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.unsplash_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unsplash_photos_id_seq OWNER TO vikunja;

--
-- Name: unsplash_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.unsplash_photos_id_seq OWNED BY public.unsplash_photos.id;


--
-- Name: user_tokens; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.user_tokens (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    token character varying(450) NOT NULL,
    kind integer NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.user_tokens OWNER TO vikunja;

--
-- Name: user_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.user_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_tokens_id_seq OWNER TO vikunja;

--
-- Name: user_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.user_tokens_id_seq OWNED BY public.user_tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text,
    username character varying(250) NOT NULL,
    password character varying(250),
    email character varying(250),
    status integer DEFAULT 0,
    avatar_provider character varying(255),
    avatar_file_id bigint,
    issuer text,
    subject text,
    email_reminders_enabled boolean DEFAULT true,
    discoverable_by_name boolean DEFAULT false,
    discoverable_by_email boolean DEFAULT false,
    overdue_tasks_reminders_enabled boolean DEFAULT true,
    overdue_tasks_reminders_time character varying(5) DEFAULT '09:00'::character varying NOT NULL,
    default_project_id bigint,
    week_start integer,
    language character varying(50),
    timezone character varying(255),
    deletion_scheduled_at timestamp without time zone,
    deletion_last_reminder_sent timestamp without time zone,
    frontend_settings json,
    extra_settings_links json,
    export_file_id bigint,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO vikunja;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vikunja;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_projects; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.users_projects (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    project_id bigint NOT NULL,
    permission bigint DEFAULT 0 NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.users_projects OWNER TO vikunja;

--
-- Name: users_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.users_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_projects_id_seq OWNER TO vikunja;

--
-- Name: users_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.users_projects_id_seq OWNED BY public.users_projects.id;


--
-- Name: webhooks; Type: TABLE; Schema: public; Owner: vikunja
--

CREATE TABLE public.webhooks (
    id bigint NOT NULL,
    target_url character varying(255) NOT NULL,
    events json NOT NULL,
    project_id bigint NOT NULL,
    secret character varying(255),
    created_by_id bigint NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.webhooks OWNER TO vikunja;

--
-- Name: webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: vikunja
--

CREATE SEQUENCE public.webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.webhooks_id_seq OWNER TO vikunja;

--
-- Name: webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vikunja
--

ALTER SEQUENCE public.webhooks_id_seq OWNED BY public.webhooks.id;


--
-- Name: api_tokens id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.api_tokens ALTER COLUMN id SET DEFAULT nextval('public.api_tokens_id_seq'::regclass);


--
-- Name: buckets id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.buckets ALTER COLUMN id SET DEFAULT nextval('public.buckets_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: label_tasks id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.label_tasks ALTER COLUMN id SET DEFAULT nextval('public.label_tasks_id_seq'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.labels ALTER COLUMN id SET DEFAULT nextval('public.labels_id_seq'::regclass);


--
-- Name: link_shares id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.link_shares ALTER COLUMN id SET DEFAULT nextval('public.link_shares_id_seq'::regclass);


--
-- Name: migration_status id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.migration_status ALTER COLUMN id SET DEFAULT nextval('public.migration_status_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: project_views id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.project_views ALTER COLUMN id SET DEFAULT nextval('public.project_views_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: reactions id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.reactions ALTER COLUMN id SET DEFAULT nextval('public.reactions_id_seq'::regclass);


--
-- Name: saved_filters id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.saved_filters ALTER COLUMN id SET DEFAULT nextval('public.saved_filters_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: task_assignees id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_assignees ALTER COLUMN id SET DEFAULT nextval('public.task_assignees_id_seq'::regclass);


--
-- Name: task_attachments id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_attachments ALTER COLUMN id SET DEFAULT nextval('public.task_attachments_id_seq'::regclass);


--
-- Name: task_comments id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_comments ALTER COLUMN id SET DEFAULT nextval('public.task_comments_id_seq'::regclass);


--
-- Name: task_relations id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_relations ALTER COLUMN id SET DEFAULT nextval('public.task_relations_id_seq'::regclass);


--
-- Name: task_reminders id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_reminders ALTER COLUMN id SET DEFAULT nextval('public.task_reminders_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: team_members id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.team_members ALTER COLUMN id SET DEFAULT nextval('public.team_members_id_seq'::regclass);


--
-- Name: team_projects id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.team_projects ALTER COLUMN id SET DEFAULT nextval('public.team_projects_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: totp id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.totp ALTER COLUMN id SET DEFAULT nextval('public.totp_id_seq'::regclass);


--
-- Name: unsplash_photos id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.unsplash_photos ALTER COLUMN id SET DEFAULT nextval('public.unsplash_photos_id_seq'::regclass);


--
-- Name: user_tokens id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.user_tokens ALTER COLUMN id SET DEFAULT nextval('public.user_tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_projects id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.users_projects ALTER COLUMN id SET DEFAULT nextval('public.users_projects_id_seq'::regclass);


--
-- Name: webhooks id; Type: DEFAULT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_id_seq'::regclass);


--
-- Data for Name: api_tokens; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.api_tokens (id, title, token_salt, token_hash, token_last_eight, permissions, expires_at, created, owner_id) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.buckets (id, title, project_view_id, "limit", "position", created, updated, created_by_id) FROM stdin;
1	To-Do	4	0	100	2026-01-10 23:59:39	2026-01-10 23:59:39	1
2	Doing	4	0	200	2026-01-10 23:59:39	2026-01-10 23:59:39	1
3	Done	4	0	300	2026-01-10 23:59:39	2026-01-10 23:59:39	1
4	To-Do	8	0	100	2026-01-10 23:59:45	2026-01-10 23:59:45	2
5	Doing	8	0	200	2026-01-10 23:59:45	2026-01-10 23:59:45	2
6	Done	8	0	300	2026-01-10 23:59:45	2026-01-10 23:59:45	2
7	To-Do	12	0	100	2026-01-10 23:59:50	2026-01-10 23:59:50	3
8	Doing	12	0	200	2026-01-10 23:59:50	2026-01-10 23:59:50	3
9	Done	12	0	300	2026-01-10 23:59:50	2026-01-10 23:59:50	3
11	Doing	16	0	200	2026-01-11 00:02:00	2026-01-11 00:02:00	2
12	Done	16	0	300	2026-01-11 00:02:00	2026-01-11 00:02:00	2
42	Doing	56	0	200	2026-01-12 18:33:30	2026-01-12 18:33:30	4
43	Done	56	0	300	2026-01-12 18:33:30	2026-01-12 18:33:30	4
19	Blocked/Waiting on others	16	0	1245184	2026-01-11 00:14:24	2026-01-11 00:14:24	2
20	To-Do	28	0	100	2026-01-11 11:08:36	2026-01-11 11:08:36	4
21	Doing	28	0	200	2026-01-11 11:08:36	2026-01-11 11:08:36	4
22	Done	28	0	300	2026-01-11 11:08:36	2026-01-11 11:08:36	4
23	To-Do	32	0	100	2026-01-11 11:10:11	2026-01-11 11:10:11	4
24	Doing	32	0	200	2026-01-11 11:10:11	2026-01-11 11:10:11	4
25	Done	32	0	300	2026-01-11 11:10:11	2026-01-11 11:10:11	4
26	To-Do	36	0	100	2026-01-11 11:14:08	2026-01-11 11:14:08	4
27	Doing	36	0	200	2026-01-11 11:14:08	2026-01-11 11:14:08	4
28	Done	36	0	300	2026-01-11 11:14:08	2026-01-11 11:14:08	4
29	To-Do	40	0	100	2026-01-11 11:15:01	2026-01-11 11:15:01	4
30	Doing	40	0	200	2026-01-11 11:15:01	2026-01-11 11:15:01	4
31	Done	40	0	300	2026-01-11 11:15:01	2026-01-11 11:15:01	4
32	To-Do	44	0	100	2026-01-11 11:16:05	2026-01-11 11:16:05	4
33	Doing	44	0	200	2026-01-11 11:16:05	2026-01-11 11:16:05	4
34	Done	44	0	300	2026-01-11 11:16:05	2026-01-11 11:16:05	4
35	To-Do	48	0	100	2026-01-12 18:29:07	2026-01-12 18:29:07	5
36	Doing	48	0	200	2026-01-12 18:29:07	2026-01-12 18:29:07	5
37	Done	48	0	300	2026-01-12 18:29:07	2026-01-12 18:29:07	5
38	To-Do	52	0	100	2026-01-12 18:31:23	2026-01-12 18:31:23	6
39	Doing	52	0	200	2026-01-12 18:31:23	2026-01-12 18:31:23	6
40	Done	52	0	300	2026-01-12 18:31:23	2026-01-12 18:31:23	6
44	To-Do	60	0	100	2026-01-12 18:34:11	2026-01-12 18:34:11	7
45	Doing	60	0	200	2026-01-12 18:34:11	2026-01-12 18:34:11	7
46	Done	60	0	300	2026-01-12 18:34:11	2026-01-12 18:34:11	7
41	To-Do	56	0	100	2026-01-12 18:33:30	2026-01-12 18:34:43	4
47	To-Do	61	0	100	2026-01-12 18:35:13	2026-01-12 18:35:13	2
48	Doing	61	0	200	2026-01-12 18:35:13	2026-01-12 18:35:13	2
49	Done	61	0	300	2026-01-12 18:35:13	2026-01-12 18:35:13	2
50	To-Do	65	0	100	2026-01-12 18:36:40	2026-01-12 18:36:40	4
51	Doing	65	0	200	2026-01-12 18:36:40	2026-01-12 18:36:40	4
52	Done	65	0	300	2026-01-12 18:36:40	2026-01-12 18:36:40	4
53	To-Do	69	0	100	2026-01-12 18:42:19	2026-01-12 18:42:19	8
54	Doing	69	0	200	2026-01-12 18:42:19	2026-01-12 18:42:19	8
55	Done	69	0	300	2026-01-12 18:42:19	2026-01-12 18:42:19	8
10	To-Do	16	0	100	2026-01-11 00:02:00	2026-01-12 20:48:51	2
56	To-Do	76	0	100	2026-01-13 10:18:42	2026-01-13 10:18:42	9
57	Doing	76	0	200	2026-01-13 10:18:42	2026-01-13 10:18:42	9
58	Done	76	0	300	2026-01-13 10:18:42	2026-01-13 10:18:42	9
59	To-Do	80	0	100	2026-01-13 10:26:02	2026-01-13 10:26:02	10
60	Doing	80	0	200	2026-01-13 10:26:02	2026-01-13 10:26:02	10
61	Done	80	0	300	2026-01-13 10:26:02	2026-01-13 10:26:02	10
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.favorites (entity_id, user_id, kind) FROM stdin;
4	2	2
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.files (id, name, mime, size, created, created_by_id) FROM stdin;
1	image.png		5092	2026-01-11 21:13:19	2
2	image.png		5092	2026-01-11 21:13:21	2
3	image.png		94292	2026-01-12 18:47:09	5
4	image.png		94292	2026-01-12 18:47:32	5
5	image.png		94292	2026-01-12 18:48:19	5
6	avatar.png	image/png	675666	2026-01-12 18:51:14	7
7	Unbenannt-1.png		76146	2026-01-12 19:00:55	2
\.


--
-- Data for Name: label_tasks; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.label_tasks (id, task_id, label_id, created) FROM stdin;
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.labels (id, title, description, hex_color, created_by_id, created, updated) FROM stdin;
1	Admin Interface		fd8a09	2	2026-01-11 21:14:27	2026-01-11 21:14:27
2	Archive		25be8b	2	2026-01-11 21:14:30	2026-01-11 21:14:30
3	Blog		8338ec	2	2026-01-11 21:14:34	2026-01-11 21:14:34
4	Frontend		373f47	2	2026-01-11 21:14:41	2026-01-11 21:14:41
\.


--
-- Data for Name: link_shares; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.link_shares (id, hash, name, project_id, permission, sharing_type, password, shared_by_id, created, updated) FROM stdin;
\.


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.migration (id, description) FROM stdin;
SCHEMA_INIT	
20190324205606	
20190328074430	
20190430111111	
20190511202210	
20190514192749	
20190524205441	
20190718200716	
20190818210133	
20190920185205	
20190922205826	
20191008194238	
20191010131430	
20191207204427	
20191207220736	
20200120201756	
20200219183248	
20200308205855	
20200308210130	
20200322214440	
20200322214624	
20200417175201	
20200418230432	
20200418230605	
20200420215928	
20200425182634	
20200509103709	
20200515172220	
20200515195546	
20200516123847	
20200524221534	
20200524224611	
20200614113230	
20200621214452	
20200801183357	
20200904101559	
20200905151040	
20200905232458	
20200906184746	
20201025195822	
20201121181647	
20201218152741	
20201218220204	
20201219145028	
20210207192805	
20210209204715	
20210220222121	
20210221111953	
20210321185225	
20210328191017	
20210403145503	
20210403220653	
20210407170753	
20210411113105	
20210411161337	
20210413131057	
20210527105701	
20210603174608	
20210709191101	
20210709211508	
20210711173657	
20210713213622	
20210725153703	
20210727204942	
20210727211037	
20210729142940	
20210802081716	
20210829194722	
20211212151642	
20211212210054	
20220112211537	
20220616145228	
20220815200851	
20221002120521	
20221113170740	
20221228112131	
20230104152903	
20230307171848	
20230611170341	
20230824132533	
20230828125443	
20230831155832	
20230903143017	
20230913202615	
20231022144641	
20231108231513	
20231121191822	
20240114224713	
20240304153738	
20240309111148	
20240311173251	
20240313230538	
20240314214802	
20240315093418	
20240315104205	
20240315110428	
20240329170952	
20240406125227	
20240603172746	
20240919130957	
20241028131622	
20241118123644	
20241119115012	
20250317174522	
20250323212553	
20250402173109	
20250624092830	
20250813093602	
20251001113831	
20251108154913	
20251118125156	
\.


--
-- Data for Name: migration_status; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.migration_status (id, user_id, migrator_name, started_at, finished_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.notifications (id, notifiable_id, notification, name, subject_id, read_at, created) FROM stdin;
1	4	{"member":{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z"},"doer":{"id":2,"name":"","username":"yuna","email":"allthethingsiwanttohave@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":2,"name":"Beautv Website Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true}],"created":"2026-01-11T00:11:03Z","updated":"2026-01-11T00:11:06Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-11 21:22:51
2	4	{"member":{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z"},"doer":{"id":2,"name":"","username":"yuna","email":"allthethingsiwanttohave@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":1,"name":"Beautv Art Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true}],"created":"2026-01-11T00:10:31Z","updated":"2026-01-11T00:10:48Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:25:24
3	5	{"member":{"id":5,"name":"","username":"Rubilak","created":"2026-01-12T18:29:07Z","updated":"2026-01-12T18:30:01Z"},"doer":{"id":2,"name":"","username":"yuna","email":"allthethingsiwanttohave@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":2,"name":"Beautv Website Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true},{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z","admin":false}],"created":"2026-01-11T00:11:03Z","updated":"2026-01-11T00:11:06Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:30:30
4	5	{"member":{"id":5,"name":"","username":"Rubilak","created":"2026-01-12T18:29:07Z","updated":"2026-01-12T18:30:01Z"},"doer":{"id":4,"name":"","username":"PixPia","email":"pixpiaemail@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":1,"name":"Beautv Art Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true},{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z","admin":true}],"created":"2026-01-11T00:10:31Z","updated":"2026-01-11T00:10:48Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:30:37
5	5	{"doer":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"task":{"id":49,"title":"Squirkle statt viereckige kacheln","description":"","done":false,"done_at":"0001-01-01T00:00:00Z","due_date":"0001-01-01T00:00:00Z","reminders":null,"project_id":4,"repeat_after":0,"repeat_mode":0,"priority":0,"start_date":"0001-01-01T00:00:00Z","end_date":"0001-01-01T00:00:00Z","assignees":null,"labels":null,"hex_color":"","percent_done":0,"identifier":"","index":24,"related_tasks":null,"attachments":null,"cover_image_attachment_id":0,"is_favorite":false,"created":"2026-01-12T18:22:50Z","updated":"2026-01-12T18:31:33Z","bucket_id":0,"position":0,"reactions":null,"created_by":null},"comment":{"id":2,"comment":"\\u003cp\\u003evon \\u003cmention-user data-id=\\"Rubilak\\" data-label=\\"Rubilak\\" data-mention-suggestion-char=\\"@\\"\\u003e\\u003c/mention-user\\u003e vorgeschlagen\\u003c/p\\u003e","author":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"reactions":{},"created":"2026-01-12T18:31:33.172137773Z","updated":"2026-01-12T18:31:33.172141198Z"},"mentioned":true}	task.comment	2	\N	2026-01-12 18:31:33
6	6	{"member":{"id":6,"name":"","username":"Anruki","created":"2026-01-12T18:31:23Z","updated":"2026-01-12T18:32:10Z"},"doer":{"id":4,"name":"","username":"PixPia","email":"pixpiaemail@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":1,"name":"Beautv Art Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true},{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z","admin":true},{"id":5,"name":"","username":"Rubilak","created":"2026-01-12T18:29:07Z","updated":"2026-01-12T18:32:16Z","admin":false}],"created":"2026-01-11T00:10:31Z","updated":"2026-01-12T18:30:48Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:32:20
7	7	{"member":{"id":7,"name":"","username":"Soba","created":"2026-01-12T18:34:11Z","updated":"2026-01-12T18:34:11Z"},"doer":{"id":4,"name":"","username":"PixPia","email":"pixpiaemail@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":7,"name":"Interview","description":"","external_id":"","created_by":{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z"},"members":[{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z","admin":true}],"created":"2026-01-12T18:35:16Z","updated":"2026-01-12T18:35:16Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:35:57
8	4	{"member":{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z"},"doer":{"id":2,"name":"","username":"yuna","email":"allthethingsiwanttohave@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":3,"name":"Beautv Interview Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true}],"created":"2026-01-11T00:11:36Z","updated":"2026-01-11T00:11:36Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:37:22
9	4	{"member":{"id":4,"name":"","username":"PixPia","created":"2026-01-11T11:08:36Z","updated":"2026-01-11T21:22:41Z"},"doer":{"id":2,"name":"","username":"yuna","email":"allthethingsiwanttohave@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"team":{"id":5,"name":"Beautv was sind Vtuber Team","description":"","external_id":"","created_by":{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z"},"members":[{"id":2,"name":"","username":"yuna","created":"2026-01-10T23:59:45Z","updated":"2026-01-11T00:37:44Z","admin":true}],"created":"2026-01-11T00:40:18Z","updated":"2026-01-11T00:40:18Z","is_public":false,"include_public":false}}	team.member.added	0	\N	2026-01-12 18:37:49
10	5	{"doer":{"id":6,"name":"","username":"Anruki","email":"anrukiart@gmail.com","created":"0001-01-01T00:00:00Z","updated":"0001-01-01T00:00:00Z"},"task":{"id":53,"title":"2 Chibis (Rubi)","description":"\\u003cp\\u003eKeychains? etc.\\u003c/p\\u003e\\u003cp\\u003e\\u003c/p\\u003e","done":false,"done_at":"0001-01-01T00:00:00Z","due_date":"0001-01-01T00:00:00Z","reminders":null,"project_id":14,"repeat_after":0,"repeat_mode":0,"priority":0,"start_date":"0001-01-01T00:00:00Z","end_date":"0001-01-01T00:00:00Z","assignees":null,"labels":null,"hex_color":"","percent_done":0,"identifier":"","index":2,"related_tasks":null,"attachments":null,"cover_image_attachment_id":0,"is_favorite":false,"created":"2026-01-12T18:39:07Z","updated":"2026-01-12T18:41:14Z","bucket_id":0,"position":0,"reactions":null,"created_by":null},"assignee":{"id":5,"name":"","username":"Rubilak","created":"2026-01-12T18:29:07Z","updated":"2026-01-12T18:32:16Z"}}	task.assigned	0	\N	2026-01-12 18:41:14
\.


--
-- Data for Name: project_views; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.project_views (id, title, project_id, view_kind, filter, "position", bucket_configuration_mode, bucket_configuration, default_bucket_id, done_bucket_id, updated, created) FROM stdin;
1	List	1	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-10 23:59:39	2026-01-10 23:59:39
2	Gantt	1	1	\N	200	0	null	0	0	2026-01-10 23:59:39	2026-01-10 23:59:39
3	Table	1	2	\N	300	0	null	0	0	2026-01-10 23:59:39	2026-01-10 23:59:39
4	Kanban	1	3	\N	400	1	null	1	3	2026-01-10 23:59:39	2026-01-10 23:59:39
5	List	2	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-10 23:59:45	2026-01-10 23:59:45
6	Gantt	2	1	\N	200	0	null	0	0	2026-01-10 23:59:45	2026-01-10 23:59:45
7	Table	2	2	\N	300	0	null	0	0	2026-01-10 23:59:45	2026-01-10 23:59:45
8	Kanban	2	3	\N	400	1	null	4	6	2026-01-10 23:59:45	2026-01-10 23:59:45
9	List	3	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-10 23:59:50	2026-01-10 23:59:50
10	Gantt	3	1	\N	200	0	null	0	0	2026-01-10 23:59:50	2026-01-10 23:59:50
11	Table	3	2	\N	300	0	null	0	0	2026-01-10 23:59:50	2026-01-10 23:59:50
12	Kanban	3	3	\N	400	1	null	7	9	2026-01-10 23:59:50	2026-01-10 23:59:50
25	List	7	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-11 11:08:36	2026-01-11 11:08:36
26	Gantt	7	1	\N	200	0	null	0	0	2026-01-11 11:08:36	2026-01-11 11:08:36
27	Table	7	2	\N	300	0	null	0	0	2026-01-11 11:08:36	2026-01-11 11:08:36
28	Kanban	7	3	\N	400	1	null	20	22	2026-01-11 11:08:36	2026-01-11 11:08:36
29	List	8	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-11 11:10:11	2026-01-11 11:10:11
30	Gantt	8	1	\N	200	0	null	0	0	2026-01-11 11:10:11	2026-01-11 11:10:11
31	Table	8	2	\N	300	0	null	0	0	2026-01-11 11:10:11	2026-01-11 11:10:11
32	Kanban	8	3	\N	400	1	null	23	25	2026-01-11 11:10:11	2026-01-11 11:10:11
33	List	9	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-11 11:14:08	2026-01-11 11:14:08
34	Gantt	9	1	\N	200	0	null	0	0	2026-01-11 11:14:08	2026-01-11 11:14:08
35	Table	9	2	\N	300	0	null	0	0	2026-01-11 11:14:08	2026-01-11 11:14:08
36	Kanban	9	3	\N	400	1	null	26	28	2026-01-11 11:14:08	2026-01-11 11:14:08
37	List	10	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-11 11:15:01	2026-01-11 11:15:01
38	Gantt	10	1	\N	200	0	null	0	0	2026-01-11 11:15:01	2026-01-11 11:15:01
39	Table	10	2	\N	300	0	null	0	0	2026-01-11 11:15:01	2026-01-11 11:15:01
40	Kanban	10	3	\N	400	1	null	29	31	2026-01-11 11:15:01	2026-01-11 11:15:01
41	List	11	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-11 11:16:05	2026-01-11 11:16:05
42	Gantt	11	1	\N	200	0	null	0	0	2026-01-11 11:16:05	2026-01-11 11:16:05
43	Table	11	2	\N	300	0	null	0	0	2026-01-11 11:16:05	2026-01-11 11:16:05
44	Kanban	11	3	\N	400	1	null	32	34	2026-01-11 11:16:05	2026-01-11 11:16:05
16	Kanban	4	3	{"s":"","sort_by":[],"order_by":[],"filter":"","filter_include_nulls":true}	400	1	[]	10	12	2026-01-11 23:46:56	2026-01-11 00:02:00
45	List	12	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-12 18:29:07	2026-01-12 18:29:07
46	Gantt	12	1	\N	200	0	null	0	0	2026-01-12 18:29:07	2026-01-12 18:29:07
47	Table	12	2	\N	300	0	null	0	0	2026-01-12 18:29:07	2026-01-12 18:29:07
48	Kanban	12	3	\N	400	1	null	35	37	2026-01-12 18:29:07	2026-01-12 18:29:07
49	List	13	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-12 18:31:23	2026-01-12 18:31:23
50	Gantt	13	1	\N	200	0	null	0	0	2026-01-12 18:31:23	2026-01-12 18:31:23
51	Table	13	2	\N	300	0	null	0	0	2026-01-12 18:31:23	2026-01-12 18:31:23
52	Kanban	13	3	\N	400	1	null	38	40	2026-01-12 18:31:23	2026-01-12 18:31:23
53	List	14	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-12 18:33:30	2026-01-12 18:33:30
54	Gantt	14	1	\N	200	0	null	0	0	2026-01-12 18:33:30	2026-01-12 18:33:30
55	Table	14	2	\N	300	0	null	0	0	2026-01-12 18:33:30	2026-01-12 18:33:30
56	Kanban	14	3	\N	400	1	null	41	43	2026-01-12 18:33:30	2026-01-12 18:33:30
57	List	15	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-12 18:34:11	2026-01-12 18:34:11
58	Gantt	15	1	\N	200	0	null	0	0	2026-01-12 18:34:11	2026-01-12 18:34:11
59	Table	15	2	\N	300	0	null	0	0	2026-01-12 18:34:11	2026-01-12 18:34:11
60	Kanban	15	3	\N	400	1	null	44	46	2026-01-12 18:34:11	2026-01-12 18:34:11
62	List	16	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-12 18:36:40	2026-01-12 18:36:40
63	Gantt	16	1	\N	200	0	null	0	0	2026-01-12 18:36:40	2026-01-12 18:36:40
64	Table	16	2	\N	300	0	null	0	0	2026-01-12 18:36:40	2026-01-12 18:36:40
65	Kanban	16	3	\N	400	1	null	50	52	2026-01-12 18:36:40	2026-01-12 18:36:40
66	List	17	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-12 18:42:19	2026-01-12 18:42:19
67	Gantt	17	1	\N	200	0	null	0	0	2026-01-12 18:42:19	2026-01-12 18:42:19
68	Table	17	2	\N	300	0	null	0	0	2026-01-12 18:42:19	2026-01-12 18:42:19
69	Kanban	17	3	\N	400	1	null	53	55	2026-01-12 18:42:19	2026-01-12 18:42:19
70	All	4	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	0	0	[]	0	0	2026-01-12 19:14:05	2026-01-12 19:14:05
61	Priorisierung	4	3	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	0	2	[{"title":"Urgent","filter":{"s":"","sort_by":null,"order_by":null,"filter":"priority=4","filter_include_nulls":false}},{"title":"Do NOW","filter":{"s":"","sort_by":null,"order_by":null,"filter":"priority=5","filter_include_nulls":false}}]	47	49	2026-01-12 20:04:54	2026-01-12 18:35:13
72	Zugewiesen	4	3	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	0	2	[{"title":"Yuna","filter":{"s":"","sort_by":null,"order_by":null,"filter":"assignees=yuna","filter_include_nulls":false}},{"title":"ohne","filter":{"s":"","sort_by":null,"order_by":null,"filter":"assignees!=yuna","filter_include_nulls":false}}]	0	0	2026-01-12 20:33:26	2026-01-12 20:12:18
73	List	18	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-13 10:18:42	2026-01-13 10:18:42
74	Gantt	18	1	\N	200	0	null	0	0	2026-01-13 10:18:42	2026-01-13 10:18:42
75	Table	18	2	\N	300	0	null	0	0	2026-01-13 10:18:42	2026-01-13 10:18:42
76	Kanban	18	3	\N	400	1	null	56	58	2026-01-13 10:18:42	2026-01-13 10:18:42
77	List	19	0	{"s":"","sort_by":null,"order_by":null,"filter":"done = false","filter_include_nulls":false}	100	0	null	0	0	2026-01-13 10:26:02	2026-01-13 10:26:02
78	Gantt	19	1	\N	200	0	null	0	0	2026-01-13 10:26:02	2026-01-13 10:26:02
79	Table	19	2	\N	300	0	null	0	0	2026-01-13 10:26:02	2026-01-13 10:26:02
80	Kanban	19	3	\N	400	1	null	59	61	2026-01-13 10:26:02	2026-01-13 10:26:02
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.projects (id, title, description, identifier, hex_color, owner_id, parent_project_id, is_archived, background_file_id, background_blur_hash, "position", created, updated) FROM stdin;
1	Inbox				1	0	f	0		65536	2026-01-10 23:59:39	2026-01-10 23:59:39
3	Inbox				3	0	f	0		196608	2026-01-10 23:59:50	2026-01-10 23:59:50
10	Showcaseheft				4	8	f	0		655360	2026-01-11 11:15:01	2026-01-11 11:15:55
16	Interview				4	0	f	0		1048576	2026-01-12 18:36:40	2026-01-12 18:37:01
11	Anime Messe Kassel				4	0	f	0		720896	2026-01-11 11:16:05	2026-01-11 11:17:26
14	Art TEAM				4	0	f	0		917504	2026-01-12 18:33:30	2026-01-12 18:47:33
4	Beautv Seite				2	0	f	0		262144	2026-01-11 00:02:00	2026-01-12 22:55:02
18	Inbox				9	0	f	0		1179648	2026-01-13 10:18:42	2026-01-13 10:18:42
19	Inbox				10	0	f	0		1245184	2026-01-13 10:26:02	2026-01-13 10:26:02
17	Inbox				8	0	f	0		1114112	2026-01-12 18:42:19	2026-01-12 18:42:19
2	Inbox				2	0	f	0		131072	2026-01-10 23:59:45	2026-01-11 00:30:39
8	Dokomi 2026			7f23ff	4	0	f	0		524288	2026-01-11 11:10:11	2026-01-11 11:13:48
12	Inbox				5	0	f	0		786432	2026-01-12 18:29:07	2026-01-12 18:29:07
7	Inbox				4	0	f	0		131072	2026-01-11 11:08:36	2026-01-12 18:33:05
13	Inbox				6	0	f	0		851968	2026-01-12 18:31:23	2026-01-12 18:33:26
9	Meet & Greet				4	8	f	0		589824	2026-01-11 11:14:08	2026-01-11 11:14:39
15	Inbox				7	0	f	0		983040	2026-01-12 18:34:11	2026-01-12 18:34:11
\.


--
-- Data for Name: reactions; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.reactions (id, user_id, entity_id, entity_kind, value, created) FROM stdin;
\.


--
-- Data for Name: saved_filters; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.saved_filters (id, filters, title, description, owner_id, is_favorite, created, updated) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.subscriptions (id, entity_type, entity_id, user_id, created) FROM stdin;
1	3	5	2	2026-01-11 00:19:40
2	3	49	2	2026-01-12 18:32:14
3	3	30	2	2026-01-12 18:32:25
4	3	53	5	2026-01-12 18:41:14
5	3	54	6	2026-01-12 18:42:03
6	3	72	2	2026-01-12 20:34:15
7	3	71	2	2026-01-12 20:34:27
8	3	1	2	2026-01-12 20:34:37
9	3	7	2	2026-01-12 20:36:01
10	3	31	2	2026-01-12 20:36:27
11	3	33	2	2026-01-12 20:37:28
12	3	34	2	2026-01-12 20:37:34
13	3	35	2	2026-01-12 20:37:40
14	3	38	2	2026-01-12 20:37:46
15	3	39	2	2026-01-12 20:37:52
16	3	40	2	2026-01-12 20:38:03
17	3	41	2	2026-01-12 20:38:15
18	3	43	2	2026-01-12 20:38:21
19	3	73	2	2026-01-12 20:38:34
20	3	44	2	2026-01-12 20:39:15
21	3	45	2	2026-01-12 20:39:29
22	3	58	2	2026-01-12 20:40:21
23	3	46	2	2026-01-12 20:40:28
24	3	47	2	2026-01-12 20:40:34
25	3	48	2	2026-01-12 20:40:41
26	3	55	2	2026-01-12 20:41:25
27	3	57	2	2026-01-12 20:41:29
28	3	59	2	2026-01-12 20:41:33
29	3	60	2	2026-01-12 20:41:38
30	3	61	2	2026-01-12 20:43:26
31	3	62	2	2026-01-12 20:43:35
32	3	63	2	2026-01-12 20:44:44
33	3	64	2	2026-01-12 20:45:05
34	3	65	2	2026-01-12 20:45:12
35	3	67	2	2026-01-12 20:45:28
36	3	68	2	2026-01-12 20:45:34
37	3	69	2	2026-01-12 20:45:38
38	3	70	2	2026-01-12 20:46:14
39	3	74	2	2026-01-12 22:55:07
\.


--
-- Data for Name: task_assignees; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_assignees (id, task_id, user_id, created) FROM stdin;
1	5	2	2026-01-11 00:19:40
2	49	2	2026-01-12 18:32:14
3	30	2	2026-01-12 18:32:25
4	53	5	2026-01-12 18:41:14
5	54	6	2026-01-12 18:42:03
6	72	2	2026-01-12 20:34:15
7	71	2	2026-01-12 20:34:27
8	1	2	2026-01-12 20:34:37
9	7	2	2026-01-12 20:36:01
10	31	2	2026-01-12 20:36:27
11	33	2	2026-01-12 20:37:28
12	34	2	2026-01-12 20:37:34
13	35	2	2026-01-12 20:37:40
14	38	2	2026-01-12 20:37:46
15	39	2	2026-01-12 20:37:52
16	40	2	2026-01-12 20:38:03
17	41	2	2026-01-12 20:38:15
18	43	2	2026-01-12 20:38:21
19	73	2	2026-01-12 20:38:34
20	44	2	2026-01-12 20:39:15
21	45	2	2026-01-12 20:39:29
22	58	2	2026-01-12 20:40:21
23	46	2	2026-01-12 20:40:28
24	47	2	2026-01-12 20:40:34
25	48	2	2026-01-12 20:40:41
26	55	2	2026-01-12 20:41:25
27	57	2	2026-01-12 20:41:29
28	59	2	2026-01-12 20:41:33
29	60	2	2026-01-12 20:41:38
30	61	2	2026-01-12 20:43:26
31	62	2	2026-01-12 20:43:35
32	63	2	2026-01-12 20:44:44
33	64	2	2026-01-12 20:45:05
34	65	2	2026-01-12 20:45:12
35	67	2	2026-01-12 20:45:28
36	68	2	2026-01-12 20:45:34
38	69	2	2026-01-12 20:45:51
39	70	2	2026-01-12 20:46:14
40	74	2	2026-01-12 22:55:07
\.


--
-- Data for Name: task_attachments; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_attachments (id, task_id, file_id, created_by_id, created) FROM stdin;
\.


--
-- Data for Name: task_buckets; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_buckets (bucket_id, task_id, project_view_id) FROM stdin;
4	3	8
19	1	16
12	5	16
23	8	32
23	9	32
23	10	32
23	11	32
23	12	32
23	13	32
23	14	32
23	15	32
23	16	32
23	17	32
23	18	32
23	19	32
26	20	36
26	21	36
26	22	36
26	23	36
29	24	40
29	25	40
29	26	40
29	27	40
29	28	40
32	29	44
10	30	16
10	33	16
10	35	16
10	38	16
10	39	16
19	40	16
10	41	16
10	43	16
10	44	16
10	45	16
10	46	16
10	47	16
12	37	16
10	49	16
47	1	61
47	5	61
47	7	61
47	30	61
47	31	61
47	33	61
47	34	61
47	35	61
47	37	61
47	38	61
47	39	61
47	40	61
47	41	61
47	43	61
47	44	61
47	45	61
47	46	61
47	47	61
47	48	61
47	49	61
41	52	56
42	53	56
41	54	56
10	55	16
41	56	56
10	57	16
10	58	16
10	59	16
10	60	16
10	61	16
10	62	16
10	63	16
10	64	16
10	65	16
10	67	16
10	68	16
10	69	16
10	70	16
0	71	72
10	71	16
0	72	72
10	72	16
10	73	16
12	34	16
12	48	16
12	7	16
12	31	16
11	74	16
\.


--
-- Data for Name: task_comments; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_comments (id, comment, author_id, task_id, created, updated) FROM stdin;
2	<p>von <mention-user data-id="Rubilak" data-label="Rubilak" data-mention-suggestion-char="@"></mention-user> vorgeschlagen</p>	2	49	2026-01-12 18:31:33	2026-01-12 18:31:33
\.


--
-- Data for Name: task_positions; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_positions (task_id, project_view_id, "position") FROM stdin;
30	16	214748364.8
35	16	429496729.6
33	16	644245094.4000001
47	16	1073741824
52	53	65536
52	54	65536
52	55	65536
46	16	1288490188.8000002
3	5	65536
3	6	65536
3	7	65536
3	8	65536
45	16	1503238553.6000001
44	16	1717986918.4
43	16	1932735283.2
41	16	2147483648
39	16	2362232012.8
38	16	2576980377.6000004
53	56	2147483648
52	56	4294967296
55	16	102261126.09523809
1	16	3435973836.8
5	16	3650722201.6000004
57	16	51130563.047619045
59	16	12782640.761904761
37	16	3865470566.4
8	29	65536
8	30	65536
8	31	65536
8	32	65536
9	29	32768
9	30	32768
9	31	32768
9	32	32768
10	29	16384
10	30	16384
10	31	16384
10	32	16384
11	29	8192
11	30	8192
11	31	8192
11	32	8192
12	29	4096
12	30	4096
12	31	4096
12	32	4096
13	29	2048
13	30	2048
13	31	2048
13	32	2048
14	29	1024
14	30	1024
14	31	1024
14	32	1024
15	29	512
15	30	512
15	31	512
15	32	512
16	29	256
16	30	256
16	31	256
16	32	256
17	29	128
17	30	128
17	31	128
17	32	128
18	29	64
18	30	64
18	31	64
18	32	64
19	29	32
19	30	32
19	31	32
19	32	32
20	33	65536
20	34	65536
20	35	65536
20	36	65536
21	33	32768
21	34	32768
21	35	32768
21	36	32768
22	33	16384
22	34	16384
22	35	16384
22	36	16384
23	33	8192
23	34	8192
23	35	8192
23	36	8192
24	37	65536
24	38	65536
24	39	65536
24	40	65536
25	37	32768
25	38	32768
25	39	32768
25	40	32768
26	37	16384
26	38	16384
26	39	16384
26	40	16384
27	37	8192
27	38	8192
27	39	8192
27	40	8192
28	37	4096
28	38	4096
28	39	4096
28	40	4096
29	41	65536
29	42	65536
29	43	65536
29	44	65536
61	16	3195660.1904761903
1	70	153391689.14285713
5	70	460175067.4285714
7	70	613566756.5714285
40	16	4294967296
30	70	766958445.7142856
31	70	920350134.8571428
33	70	1073741824
34	70	1227133513.142857
35	70	1380525202.2857141
37	70	1533916891.4285712
38	70	1687308580.5714285
39	70	1840700269.7142856
40	70	1994091958.8571427
41	70	2147483648
43	70	2300875337.142857
44	70	2454267026.285714
45	70	2607658715.428571
46	70	2761050404.5714283
47	70	2914442093.7142854
48	70	3067833782.8571424
49	70	3221225472
55	70	3374617161.142857
57	70	3528008850.285714
58	70	3681400539.428571
59	70	3834792228.5714283
60	70	3988183917.7142854
61	70	4141575606.8571424
31	16	3865568870.4
7	16	65536
34	16	3865536102.4
48	16	3865601638.4
53	53	32768
53	54	32768
53	55	32768
72	70	3120.7619047619046
54	53	16384
54	54	16384
54	55	16384
54	56	16384
56	53	8192
56	54	8192
56	55	8192
56	56	8192
49	16	0.03125
58	16	25565281.523809522
60	16	6391320.380952381
62	16	1597830.0952380951
62	70	4294967296
63	70	798915.0476190476
63	16	798915.0476190476
64	70	399457.5238095238
64	16	399457.5238095238
65	70	199728.7619047619
65	16	199728.7619047619
67	70	399457.5238095238
67	16	399457.5238095238
68	70	49932.19047619047
68	16	49932.19047619047
69	70	24966.095238095237
69	16	24966.095238095237
70	70	12483.047619047618
70	16	12483.047619047618
1	72	119304647.1111111
5	72	357913941.3333333
7	72	477218588.4444444
30	72	596523235.5555556
31	72	715827882.6666666
33	72	835132529.7777777
34	72	954437176.8888888
35	72	1073741824
37	72	1193046471.1111112
38	72	1312351118.222222
39	72	1431655765.3333333
40	72	1550960412.4444444
41	72	1670265059.5555553
43	72	1789569706.6666665
44	72	1908874353.7777777
45	72	2028179000.8888888
46	72	2147483648
47	72	2266788295.111111
48	72	2386092942.2222223
49	72	2505397589.333333
55	72	2624702236.444444
57	72	2744006883.5555553
58	72	2863311530.6666665
59	72	2982616177.7777777
60	72	3101920824.888889
61	72	3221225472
62	72	3340530119.1111107
63	72	3459834766.222222
64	72	3579139413.333333
65	72	3698444060.444444
67	72	3937053354.6666665
68	72	4056358001.7777777
69	72	4175662648.888889
70	72	4294967296
71	70	6241.523809523809
71	72	6241.523809523809
71	16	6241.523809523809
72	72	3120.7619047619046
72	16	3120.7619047619046
73	70	1560.3809523809523
73	72	1560.3809523809523
73	16	1560.3809523809523
74	70	780.1904761904761
74	72	780.1904761904761
74	16	780.1904761904761
30	61	113025455.15789473
74	61	226050910.31578946
73	61	339076365.4736842
72	61	452101820.6315789
71	61	565127275.7894737
70	61	678152730.9473684
69	61	791178186.1052631
68	61	904203641.2631578
65	61	1017229096.4210526
64	61	1130254551.5789473
67	61	1243280006.7368422
63	61	1356305461.8947368
62	61	1469330917.0526314
61	61	1582356372.2105262
60	61	1695381827.368421
59	61	1808407282.5263157
58	61	1921432737.6842103
57	61	2034458192.8421052
55	61	2147483648
1	61	2260509103.1578946
5	61	2373534558.315789
7	61	2486560013.4736843
31	61	2599585468.631579
33	61	2712610923.7894735
34	61	2825636378.947368
35	61	2938661834.1052628
37	61	3051687289.263158
38	61	3164712744.4210525
39	61	3277738199.578947
40	61	3390763654.736842
41	61	3503789109.894737
43	61	3616814565.0526314
44	61	3729840020.210526
45	61	3842865475.3684206
46	61	3955890930.5263157
47	61	4068916385.6842103
48	61	4181941840.842105
49	61	4294967296
\.


--
-- Data for Name: task_relations; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_relations (id, task_id, other_task_id, relation_kind, created_by_id, created) FROM stdin;
1	7	49	related	2	2026-01-12 18:27:19
2	49	7	related	2	2026-01-12 18:27:19
3	33	7	related	2	2026-01-12 19:48:19
4	7	33	related	2	2026-01-12 19:48:19
5	30	7	related	2	2026-01-12 19:48:28
6	7	30	related	2	2026-01-12 19:48:28
7	31	7	related	2	2026-01-12 19:49:06
8	7	31	related	2	2026-01-12 19:49:06
9	35	7	related	2	2026-01-12 19:49:24
10	7	35	related	2	2026-01-12 19:49:24
11	7	68	related	2	2026-01-12 19:50:29
12	68	7	related	2	2026-01-12 19:50:29
13	39	7	related	2	2026-01-12 19:50:51
14	7	39	related	2	2026-01-12 19:50:51
15	55	7	related	2	2026-01-12 19:51:15
16	7	55	related	2	2026-01-12 19:51:15
17	57	7	related	2	2026-01-12 19:51:30
18	7	57	related	2	2026-01-12 19:51:30
19	58	7	related	2	2026-01-12 19:51:37
20	7	58	related	2	2026-01-12 19:51:37
21	59	7	related	2	2026-01-12 19:51:43
22	7	59	related	2	2026-01-12 19:51:43
23	60	7	related	2	2026-01-12 19:52:16
24	7	60	related	2	2026-01-12 19:52:16
25	61	7	related	2	2026-01-12 19:52:29
26	7	61	related	2	2026-01-12 19:52:29
27	62	7	related	2	2026-01-12 19:52:59
28	7	62	related	2	2026-01-12 19:52:59
29	64	7	related	2	2026-01-12 20:00:21
30	7	64	related	2	2026-01-12 20:00:21
31	67	7	related	2	2026-01-12 20:00:28
32	7	67	related	2	2026-01-12 20:00:28
33	65	7	related	2	2026-01-12 20:00:38
34	7	65	related	2	2026-01-12 20:00:38
35	7	70	related	2	2026-01-12 20:02:19
36	70	7	related	2	2026-01-12 20:02:19
37	70	45	related	2	2026-01-12 20:02:30
38	45	70	related	2	2026-01-12 20:02:30
39	7	71	related	2	2026-01-12 20:26:03
40	71	7	related	2	2026-01-12 20:26:03
41	73	7	related	2	2026-01-12 20:38:53
42	7	73	related	2	2026-01-12 20:38:53
43	58	57	related	2	2026-01-12 20:40:02
44	57	58	related	2	2026-01-12 20:40:02
45	58	55	related	2	2026-01-12 20:40:17
46	55	58	related	2	2026-01-12 20:40:17
47	63	7	related	2	2026-01-12 20:44:52
48	7	63	related	2	2026-01-12 20:44:52
\.


--
-- Data for Name: task_reminders; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_reminders (id, task_id, reminder, created, relative_period, relative_to) FROM stdin;
\.


--
-- Data for Name: task_unread_statuses; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.task_unread_statuses (task_id, user_id) FROM stdin;
49	4
49	5
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.tasks (id, title, description, done, done_at, due_date, project_id, repeat_after, repeat_mode, priority, start_date, end_date, hex_color, percent_done, index, uid, cover_image_attachment_id, created, updated, created_by_id) FROM stdin;
5	Mit der Pipeline rumärgern		t	2026-01-11 00:35:03	2026-01-12 11:00:00	4	0	0	0	2026-01-03 23:00:00	2026-01-11 22:59:59		0	3	5be29425-2e0d-451d-bd0a-3c7f6d412a0c	0	2026-01-11 00:17:10	2026-01-11 00:38:34	2
8	Standpersonal abklären		f	\N	\N	8	0	0	0	\N	\N		0	1	cf0619be-6fbd-4ed3-910e-89fab6f62def	0	2026-01-11 11:10:38	2026-01-11 11:10:38	4
9	DoKomi Bewerbung		f	\N	\N	8	0	0	0	\N	\N		0	2	ef3602d5-402e-4666-bdd5-073fb9b3355f	0	2026-01-11 11:10:44	2026-01-11 11:10:44	4
10	DoKomi Workshop		f	\N	\N	8	0	0	0	\N	\N		0	3	812301e9-b4fd-4473-8286-6ad4d6169a5b	0	2026-01-11 11:10:49	2026-01-11 11:10:49	4
11	Regeln		f	\N	\N	8	0	0	0	\N	\N		0	4	6a61ee70-ef54-40b2-85f6-d840a7367fae	0	2026-01-11 11:10:55	2026-01-11 11:10:55	4
3	Alle sollen sich auf Vikunja anmelden	<ul data-type="taskList"><li data-checked="false" data-type="taskItem"><label><input type="checkbox"><span></span></label><div><p>Jeden einen Account erstellen lassen</p></div></li><li data-checked="false" data-type="taskItem"><label><input type="checkbox"><span></span></label><div><p>Alle in teams aufteilen</p></div></li><li data-checked="false" data-type="taskItem"><label><input type="checkbox"><span></span></label><div><p>Alle ihre aufgaben schreiben und in porjekte aufteilen lassen</p></div></li></ul><p></p>	f	\N	\N	2	0	0	0	\N	\N		0	1	32158785-a144-4c27-85c0-4acf935e9a90	0	2026-01-11 00:02:40	2026-01-11 00:12:56	2
12	Meet & Greet Teilnehmer suchen		f	\N	\N	8	0	0	0	\N	\N		0	5	cde3fec9-3a29-4bb1-afac-6294b03245bd	0	2026-01-11 11:11:06	2026-01-11 11:11:06	4
13	Meet & Greet Poster drucken		f	\N	\N	8	0	0	0	\N	\N		0	6	68bbdf93-406a-4797-b911-6b2ef9e70246	0	2026-01-11 11:11:14	2026-01-11 11:11:14	4
14	Regel Poster drucken		f	\N	\N	8	0	0	0	\N	\N		0	7	05ff7dd6-f6dc-4b5e-9c24-93f5db3f280e	0	2026-01-11 11:11:18	2026-01-11 11:11:18	4
15	Showcaseheft 2026 drucken		f	\N	\N	8	0	0	0	\N	\N		0	8	5de8085e-9163-4d00-9e4a-efa704fcbfb5	0	2026-01-11 11:11:25	2026-01-11 11:11:33	4
16	Decken organisieren		f	\N	\N	8	0	0	0	\N	\N		0	9	9a613194-6654-4154-8d81-7fbd0b182c4c	0	2026-01-11 11:11:43	2026-01-11 11:11:43	4
17	BEAUTV Fee Postkarten drucken		f	\N	\N	8	0	0	0	\N	\N		0	10	ce1126b4-3a4d-48c7-97d2-9747762d70df	0	2026-01-11 11:12:04	2026-01-11 11:12:04	4
18	Dokomi Team essen planen		f	\N	\N	8	0	0	0	\N	\N		0	11	5017d3b7-20ad-45fe-b69d-fe4cba3ec4e7	0	2026-01-11 11:13:31	2026-01-11 11:13:31	4
19	Dekoration organisieren		f	\N	\N	8	0	0	0	\N	\N		0	12	f31847f4-5e8a-44b9-bf80-e90b3bfa6964	0	2026-01-11 11:13:48	2026-01-11 11:13:48	4
20	Anmelde Formular erstellen		f	\N	\N	9	0	0	0	\N	\N		0	1	37932603-55fa-4072-837b-eb2382a898fe	0	2026-01-11 11:14:20	2026-01-11 11:14:20	4
21	Meet & Greets einteilen		f	\N	\N	9	0	0	0	\N	\N		0	2	3c670f22-8972-4940-a694-5c596e330888	0	2026-01-11 11:14:26	2026-01-11 11:14:26	4
22	Meet & Greet Poster erstellen		f	\N	\N	9	0	0	0	\N	\N		0	3	8bddb448-f18a-48f6-9c39-19a15a778a8b	0	2026-01-11 11:14:31	2026-01-11 11:14:31	4
23	Teilnahme bestätigungen schickem		f	\N	\N	9	0	0	0	\N	\N		0	4	e9552e50-c3cd-4608-b4f1-353e6b6387f2	0	2026-01-11 11:14:39	2026-01-11 11:14:39	4
24	Frontcover erstellen		f	\N	\N	10	0	0	0	\N	\N		0	1	64682ce5-0680-4d8f-a3e3-be1a9f45241c	0	2026-01-11 11:15:21	2026-01-11 11:15:21	4
25	Alle Seiten überprüfen		f	\N	\N	10	0	0	0	\N	\N		0	2	320f5544-64df-4a54-8779-1972d8d86492	0	2026-01-11 11:15:31	2026-01-11 11:15:31	4
26	Alle Zahlungseingänge überprüfen		f	\N	\N	10	0	0	0	\N	\N		0	3	2315c253-41d9-425a-a1f1-25f83da2f203	0	2026-01-11 11:15:39	2026-01-11 11:15:39	4
27	Heft drucken lassen		f	\N	\N	10	0	0	0	\N	\N		0	4	a9ab8906-4897-48df-a535-cfe5bd9534bb	0	2026-01-11 11:15:51	2026-01-11 11:15:51	4
28	Hefte verschickn		f	\N	\N	10	0	0	0	\N	\N		0	5	1ecdf27a-7c5c-415c-90a6-da8e0d2c9976	0	2026-01-11 11:15:55	2026-01-11 11:15:55	4
29	Nach Gespräch mit Jodaiku		f	\N	2026-02-08 11:00:00	11	0	0	0	\N	\N		0	1	305ae611-c041-46e7-9119-0519d5e114d7	0	2026-01-11 11:16:20	2026-01-11 11:17:26	4
33	Kannst du da folgendes machen: Agentur/Gruppe  und dann als Punkte: Indie, Lightmotif, Vibrant	<p>Man kann mehrere Gruppen haben aber keine mehreren argenturen</p>	f	\N	\N	4	0	0	4	\N	\N		0	8	e5269251-a27a-4d2b-b063-9828078568de	0	2026-01-11 21:13:46	2026-01-12 20:37:28	2
7	Beautv seite mit Artits ansehen	<p></p>	t	2026-01-12 22:22:35	2026-01-12 17:00:00	4	0	0	0	2026-01-11 23:00:00	2026-01-19 22:59:59		0	4	0e8060cb-d070-43fb-a86f-9c2bfd29efdb	0	2026-01-11 00:35:21	2026-01-12 22:22:35	2
31	Kannst du das überarbeiten das wir da die Bilder irgendwie direkt einziehen können? So drag and Drop mässig		t	2026-01-12 22:54:41	\N	4	0	0	5	\N	\N		0	6	b2688bf3-119f-4273-bb51-45136efde28a	0	2026-01-11 21:12:29	2026-01-12 22:54:41	2
1	Move Beautv site to its proper dns	<p>bräuchte da aber noch die zukangsdaten oder zumindest nen domain übertragungskey um sie anzukaufen</p><p>müsste man sich auch mal mit @Pia hinsetzen</p>	f	\N	\N	4	0	0	0	2026-01-31 23:00:00	2026-02-08 22:59:59		0	1	5c61ee39-2a54-4349-bc6e-05a7daf5d9a9	0	2026-01-11 00:00:25	2026-01-12 20:34:37	2
57	Pfälzisch hinzufügen		f	\N	\N	4	0	0	0	\N	\N		0	26	4f29643d-1c46-476d-93ce-c2bc097f9824	0	2026-01-12 18:44:35	2026-01-12 20:41:29	2
39	Statt agency die property im admin interface und frontetn etwas neutraleres nenenn	<p>In gruppe und agency aufteilen</p>	f	\N	\N	4	0	0	4	\N	\N		0	14	eb5fb179-ad34-4e2f-b279-624522ffcd8f	0	2026-01-11 21:41:06	2026-01-12 20:37:52	2
40	placeholder von bild foldgt ädnern		f	\N	\N	4	0	0	0	\N	\N		0	15	dfc65d47-53fa-4c78-ba29-8fe24d089c44	0	2026-01-11 21:45:24	2026-01-12 20:38:03	2
37	Vtuber managment datum graduation debut auf deutsch und encoding beim speichern wahrscheinlcih falsch		t	2026-01-11 23:46:16	\N	4	0	0	0	\N	\N		0	12	a4c02f59-1cd2-4689-95f9-6386219e186a	0	2026-01-11 21:18:49	2026-01-11 23:46:16	2
53	2 Chibis	<p>Keychains? etc.</p><p></p>	f	\N	\N	14	0	0	0	\N	\N		0	2	80888624-f825-459c-9cd6-536d4e48d138	0	2026-01-12 18:39:07	2026-01-12 18:42:22	6
45	Eine seite mit einem formular wo sie einträgen können wenn sie daten von sich eingetragen haben wollen		f	\N	\N	4	0	0	0	\N	\N		0	20	3ece3823-b443-49a8-890a-c676cbe1fdd5	0	2026-01-11 21:53:23	2026-01-12 20:39:29	2
44	projekte zu community ändern		f	\N	\N	4	0	0	2	\N	\N		0	19	db5378f9-6cbe-41d2-923c-c6bb7bf27cef	0	2026-01-11 21:52:43	2026-01-12 20:39:15	2
52	Logo erstellen	<p>Nach Ideenskizze</p><p></p>	f	\N	\N	14	0	0	0	\N	\N		0	1	0fa97445-8114-45bd-9bb2-97116690b408	0	2026-01-12 18:38:24	2026-01-12 18:38:46	6
54	Fee - Soft Illu mit Hintergrund	<p>Für Postkarten?</p><p></p>	f	\N	\N	14	0	0	0	\N	\N		0	3	d8567b2f-62e8-4725-a5f5-e7da1e19f7ce	0	2026-01-12 18:40:36	2026-01-12 18:45:42	6
49	rounded square statt viereckige kacheln		f	\N	\N	4	0	0	0	\N	\N		0	24	fce6014c-c70b-429f-8d81-58546a6b2b8d	0	2026-01-12 18:22:50	2026-01-12 19:30:16	2
56	Banner für Webseite erstellen	<p>Für die Beautv Webseite sollen verschiedene Banner für die neue Webseite erstellt werden:</p><p>Interviews</p><p>Special</p><p>Social Line</p><p></p>	f	\N	\N	14	0	0	0	\N	\N		0	4	33aba0d8-77af-4e48-af2a-e680eb2fca29	0	2026-01-12 18:44:17	2026-01-12 18:47:33	5
30	Zeichenlimit von Kannst u da ein Limit von 1000 zeichen rein machen	<p>in der description von Vtuber in vtuber managment</p>	f	\N	\N	4	0	0	4	\N	\N		0	5	2e06bb4b-21d9-44dc-8126-8a342a36a8a4	0	2026-01-11 21:12:16	2026-01-12 19:48:28	2
41	Beutv logo zu alten zu alten logo zwischendingsen		f	\N	\N	4	0	0	0	\N	\N		0	16	e7dee8c5-3afb-4435-99f5-a50a8bbf73d2	0	2026-01-11 21:46:57	2026-01-12 20:38:15	2
59	external link warnung		f	\N	\N	4	0	0	0	\N	\N		0	28	03272d56-f3f7-448d-a1a4-660d3393d113	0	2026-01-12 18:49:58	2026-01-12 20:41:33	2
46	overflow social icons vtuber frontend		f	\N	\N	4	0	0	0	\N	\N		0	21	ddb1fbd6-a95c-4a4e-8375-984e680cf1a8	0	2026-01-11 21:53:51	2026-01-12 20:40:28	2
60	canban vikunja image upload		f	\N	\N	4	0	0	0	\N	\N		0	29	dd503a98-f7fa-47c6-a3ba-15726a68c478	0	2026-01-12 18:53:51	2026-01-12 20:41:38	2
61	Beschreibung vtuber zeilabstand weniger		f	\N	\N	4	0	0	0	\N	\N		0	30	ae3fe2aa-d090-4158-9fc0-b025eb5173ea	0	2026-01-12 18:59:58	2026-01-12 20:43:26	2
62	bild oben links inzeilendings bei avatar beschreschreibung seite		f	\N	\N	4	0	0	0	\N	\N		0	31	ea4132ba-e803-40dd-ad1b-4cf0108f7db0	0	2026-01-12 19:00:25	2026-01-12 20:43:35	2
65	hinterlegung suchleiste box stattdessen trenner		f	\N	\N	4	0	0	0	\N	\N		0	34	e6a84f4c-71b9-4608-8857-ea3849a32887	0	2026-01-12 19:32:39	2026-01-12 20:45:12	2
68	Anzahl der vtuber im archiv gleichmäßig		f	\N	\N	4	0	0	0	\N	\N		0	37	ab6c3d8c-1d0a-466b-ac1d-4a0e985460c6	0	2026-01-12 19:50:29	2026-01-12 20:45:34	2
67	Footer anpassen		f	\N	\N	4	0	0	0	\N	\N		0	36	e65709e5-aeda-4922-84ed-e768bdc1eed8	0	2026-01-12 19:38:50	2026-01-12 20:45:28	2
48	jeder soll sein eigenes password ändern können	<p>evtl auch per email wenn vergessen</p>	t	2026-01-12 22:02:39	\N	4	0	0	0	\N	\N		0.6	23	72919cb8-b9c2-4f41-adb0-b37f3fee98d2	0	2026-01-11 21:58:15	2026-01-12 22:02:39	2
35	Vtuber managment admin interface vrtuber liste auf deutsch sortieren		f	\N	\N	4	0	0	4	\N	\N		0	10	9f52d588-e194-4bcc-bc8a-729809f11d01	0	2026-01-11 21:14:13	2026-01-12 20:37:40	2
43	github und download raus twitch und twitter und discord rein		f	\N	\N	4	0	0	2	\N	\N		0	18	a8e02949-ea4d-4797-aa4f-e21aaad94b53	0	2026-01-11 21:49:13	2026-01-12 20:38:21	2
58	Fränkisch hinzufügen		f	\N	\N	4	0	0	0	\N	\N		0	27	9b3145af-bd7a-4be8-895c-ecc86fe78ff7	0	2026-01-12 18:44:46	2026-01-12 20:40:21	2
47	mobile headers overflow		f	\N	\N	4	0	0	0	\N	\N		0	22	9dbf012c-a557-4807-83de-b705a20e7571	0	2026-01-11 21:54:02	2026-01-12 20:40:34	2
55	Hessischen akzent hinzufügen		f	\N	\N	4	0	0	0	\N	\N		0	25	6be9f46f-6233-4881-8fb0-1969f5a87864	0	2026-01-12 18:44:15	2026-01-12 20:41:25	2
63	seitenwechsel bubble wird groß pia bild		f	\N	\N	4	0	0	0	\N	\N		0	32	49d39233-fac9-4589-890b-da00c5541fcd	0	2026-01-12 19:28:42	2026-01-12 20:44:52	2
69	Eine Seite mit allen Grafiken und Artworks gecredit werden. Die Seite darf auch Animiert sein wie die Dokomi seite hahahahhahahah		f	\N	\N	4	0	0	0	\N	\N		0	38	67626f89-b83f-4ef8-b150-bb97718a926d	0	2026-01-12 19:55:42	2026-01-12 20:45:51	4
34	Kannst du generell alles in Deutsch irgendwie machen?		t	2026-01-12 20:46:45	\N	4	0	0	0	\N	\N		0	9	5e728fe4-c929-4172-9363-5e8b2e6a3334	0	2026-01-11 21:13:55	2026-01-12 20:46:45	2
72	accasability dingse		f	\N	\N	4	0	0	0	\N	\N		0	41	feee9b5d-ef81-4674-92a6-70e44c3c7133	0	2026-01-12 20:31:29	2026-01-12 20:34:15	2
71	rechte maustaste freischalten		f	\N	\N	4	0	0	0	\N	\N		0	40	f459dd84-7a15-4065-9934-db36f083df35	0	2026-01-12 20:26:03	2026-01-12 20:34:27	2
38	Es Soll Admin/Archiv/Interview/Was ist vtubing geben	<p><strong>Statt Editor Admin User</strong></p><p></p><p><strong>Was ist vtubung: Blogposts und die seite was ist vtubung?/vtubung? und die unterseiten</strong></p><p>Archiv für arichiv</p><p></p><p></p>	f	\N	\N	4	0	0	0	\N	\N		0	13	ffd436af-6b88-467e-be5c-67c81a830bae	0	2026-01-11 21:24:09	2026-01-12 20:37:46	2
73	Blogpost desin header von Rubis mockup		f	\N	\N	4	0	0	0	\N	\N		0	42	2c565a8c-11a0-4091-a9e7-000c09f00222	0	2026-01-12 20:37:16	2026-01-12 20:38:53	2
64	beautv buttons archiv zu toggles		f	\N	\N	4	0	0	0	\N	\N		0	33	ea8c5352-ef9a-4637-86da-9332c39d3256	0	2026-01-12 19:32:20	2026-01-12 20:45:05	2
70	Formulare erstellbar machen über Admin interface		f	\N	\N	4	0	0	0	\N	\N		0	39	6710577d-550b-4dc7-aaa0-10d2a2c1d84b	0	2026-01-12 20:02:19	2026-01-12 20:46:14	2
74	bilder die eingebettet sind in der größe und einbettung ändern		f	\N	\N	4	0	0	0	\N	\N		0	43	a75f47d7-0d39-49a4-b3bd-23507d6f7b16	0	2026-01-12 22:55:02	2026-01-12 22:55:07	2
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.team_members (id, team_id, user_id, admin, created) FROM stdin;
1	1	2	t	2026-01-11 00:10:31
2	2	2	t	2026-01-11 00:11:03
3	3	2	t	2026-01-11 00:11:36
4	4	2	t	2026-01-11 00:11:45
5	5	2	t	2026-01-11 00:40:18
6	6	4	t	2026-01-11 11:09:11
7	2	4	f	2026-01-11 21:22:51
8	1	4	t	2026-01-12 18:25:24
9	2	5	f	2026-01-12 18:30:30
11	1	6	f	2026-01-12 18:32:20
10	1	5	t	2026-01-12 18:30:37
12	7	4	t	2026-01-12 18:35:16
13	7	7	t	2026-01-12 18:35:57
14	3	4	t	2026-01-12 18:37:22
15	5	4	t	2026-01-12 18:37:49
\.


--
-- Data for Name: team_projects; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.team_projects (id, team_id, project_id, permission, created, updated) FROM stdin;
1	2	4	1	2026-01-11 00:39:37	2026-01-11 00:39:41
2	1	14	1	2026-01-12 18:33:48	2026-01-12 18:33:51
3	7	16	1	2026-01-12 18:36:59	2026-01-12 18:37:01
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.teams (id, name, description, created_by_id, external_id, issuer, created, updated, is_public) FROM stdin;
2	Beautv Website Team		2			2026-01-11 00:11:03	2026-01-11 00:11:06	f
3	Beautv Interview Team		2			2026-01-11 00:11:36	2026-01-11 00:11:36	f
4	Beautv Archive Team		2			2026-01-11 00:11:45	2026-01-11 00:11:45	f
5	Beautv was sind Vtuber Team		2			2026-01-11 00:40:18	2026-01-11 00:40:18	f
6	HEADS	<p>Das HEAD Team</p>	4			2026-01-11 11:09:11	2026-01-11 11:09:46	f
1	Beautv Art Team		2			2026-01-11 00:10:31	2026-01-12 18:30:48	f
7	Interview		4			2026-01-12 18:35:16	2026-01-12 18:35:16	f
\.


--
-- Data for Name: totp; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.totp (id, user_id, secret, enabled, url) FROM stdin;
2	7	ZYSNPMUJ4UBQXFDLTYIVQ4BUI5TGDNM7	f	otpauth://totp/Vikunja:Soba?algorithm=SHA1&digits=6&issuer=Vikunja&period=30&secret=ZYSNPMUJ4UBQXFDLTYIVQ4BUI5TGDNM7
3	2	27LUONQRISH3UYUCTWTYJ4MCWROC2AVJ	t	otpauth://totp/Vikunja:yuna?algorithm=SHA1&digits=6&issuer=Vikunja&period=30&secret=27LUONQRISH3UYUCTWTYJ4MCWROC2AVJ
\.


--
-- Data for Name: typesense_sync; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.typesense_sync (collection, sync_started_at, sync_finished_at) FROM stdin;
\.


--
-- Data for Name: unsplash_photos; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.unsplash_photos (id, file_id, unsplash_id, author, author_name) FROM stdin;
\.


--
-- Data for Name: user_tokens; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.user_tokens (id, user_id, token, kind, created) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.users (id, name, username, password, email, status, avatar_provider, avatar_file_id, issuer, subject, email_reminders_enabled, discoverable_by_name, discoverable_by_email, overdue_tasks_reminders_enabled, overdue_tasks_reminders_time, default_project_id, week_start, language, timezone, deletion_scheduled_at, deletion_last_reminder_sent, frontend_settings, extra_settings_links, export_file_id, created, updated) FROM stdin;
1		testuser1	$2a$11$Bq76R8NSV8YAMuaWunyE2uqpIhdlTiQk2HOasaWbm1J6zZD5De8ku	test1@example.com	0	initials	0	local		f	f	f	t	9:00	1	0		GMT	\N	\N	null	null	0	2026-01-10 23:59:39	2026-01-10 23:59:39
3		testuser2	$2a$11$Kgw4lsgN4AyBB1tppRCHyeq9Cb8cNoaG1PXw.1TuN5Vxw31a.8Vom	test2@example.com	0	initials	0	local		f	f	f	t	9:00	3	0		GMT	\N	\N	null	null	0	2026-01-10 23:59:50	2026-01-10 23:59:50
4		PixPia	$2a$11$V.T.0EC/vmSq4CrJfeZj8ewZtbAnKAhzy.fxfjuvHriWPmR6/UALa	pixpiaemail@gmail.com	0	initials	0	local		f	t	f	t	9:00	7	0	de-DE	GMT	\N	\N	{"allow_icon_changes":true,"color_schema":"auto","date_display":"relative","default_task_relation_type":"related","default_view":"first","minimum_priority":2,"play_sound_when_done":true,"quick_add_magic_mode":"vikunja","time_format":"24h"}	null	0	2026-01-11 11:08:36	2026-01-11 21:22:41
6		Anruki	$2a$11$A.7WHXibQfps/dwow/hVN.k9hmwmpg6y7TvjtOBUckxvajY1ZiO0i	anrukiart@gmail.com	0	initials	0	local		f	t	f	t	9:00	13	0	de-DE	GMT	\N	\N	{"allow_icon_changes":true,"color_schema":"auto","date_display":"relative","default_task_relation_type":"related","default_view":"first","minimum_priority":2,"play_sound_when_done":true,"quick_add_magic_mode":"vikunja","time_format":"24h"}	null	0	2026-01-12 18:31:23	2026-01-12 18:32:10
5		Rubilak	$2a$11$7Np8NnSdmUXcOeq6/qfvs.vtdq.2zohFXDEDGord.F1xcJ41IH7wu	maik.schneekoenig@gmail.com	0	initials	0	local		f	t	f	t	9:00	12	0	de-DE	GMT	\N	\N	{"allow_icon_changes":true,"color_schema":"auto","date_display":"relative","default_task_relation_type":"related","default_view":"first","minimum_priority":2,"play_sound_when_done":true,"quick_add_magic_mode":"vikunja","time_format":"24h"}	null	0	2026-01-12 18:29:07	2026-01-12 18:32:16
7		Soba	$2a$11$5CvS.Awp6gC1yqiItKF6vOEXdYqJrVeDYFnI3Ynx0v81E6yBg7fz2	sobasenseiart@gmail.com	0	initials	0	local		f	f	f	t	9:00	15	0	en	GMT	\N	\N	null	null	0	2026-01-12 18:34:11	2026-01-12 18:34:11
8		Wolfe	$2a$11$uJQ77Hkuv5NfzdkRohQ/MeY6e/IXub7Sg0ioegc9bTBEPT8lSzi/y	thewolfehd@gmail.com	0	initials	0	local		f	f	f	t	9:00	17	0	de-DE	GMT	\N	\N	null	null	0	2026-01-12 18:42:19	2026-01-12 18:42:19
9		admin_fallback	$2a$11$q/PEu2DJrObTtWjZQXTNGuSEYFh.0z9n5lIAK9X1ImQqJXzkL79Am	you@example.com	0	initials	0	local		f	f	f	t	9:00	18	0		GMT	\N	\N	null	null	0	2026-01-13 10:18:42	2026-01-13 10:18:42
10		littleVikunjaDragon	$2a$11$2kLY/GGhaGWwy6SmNXCYZO9HVYxq3cQHWONROkXOOE6QL4Vlm8nXW	admin@beautv.de	0	initials	0	local		f	f	f	t	9:00	19	0		GMT	\N	\N	null	null	0	2026-01-13 10:26:02	2026-01-13 10:26:02
2		yuna	$2a$11$S0IzOYmI03VWwHrFUAUFGuvYC/br4BqQfI/ooO8PA381lhD0ixcy.	allthethingsiwanttohave@gmail.com	0	gravatar	0	local		f	t	f	f	9:00	4	1	en	Europe/Berlin	\N	\N	{"allow_icon_changes":true,"color_schema":"auto","date_display":"relative","default_task_relation_type":"related","default_view":"kanban","minimum_priority":1,"play_sound_when_done":true,"quick_add_magic_mode":"vikunja","time_format":"24h"}	null	0	2026-01-10 23:59:45	2026-01-13 10:34:09
\.


--
-- Data for Name: users_projects; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.users_projects (id, user_id, project_id, permission, created, updated) FROM stdin;
\.


--
-- Data for Name: webhooks; Type: TABLE DATA; Schema: public; Owner: vikunja
--

COPY public.webhooks (id, target_url, events, project_id, secret, created_by_id, created, updated) FROM stdin;
1	http://vikunja-webhook:3000/vikunja-webhook	["project.deleted","task.assignee.created","task.comment.created","task.deleted","task.relation.created","task.assignee.deleted","project.shared.team","task.comment.deleted","task.attachment.created","project.shared.user","task.comment.edited","task.relation.deleted","task.updated","task.created","task.attachment.deleted","project.updated"]	2		2	2026-01-11 00:30:34	2026-01-11 00:30:34
\.


--
-- Name: api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.api_tokens_id_seq', 1, false);


--
-- Name: buckets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.buckets_id_seq', 61, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.files_id_seq', 7, true);


--
-- Name: label_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.label_tasks_id_seq', 1, false);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.labels_id_seq', 4, true);


--
-- Name: link_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.link_shares_id_seq', 1, false);


--
-- Name: migration_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.migration_status_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.notifications_id_seq', 10, true);


--
-- Name: project_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.project_views_id_seq', 80, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.projects_id_seq', 19, true);


--
-- Name: reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.reactions_id_seq', 1, false);


--
-- Name: saved_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.saved_filters_id_seq', 1, false);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 39, true);


--
-- Name: task_assignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.task_assignees_id_seq', 40, true);


--
-- Name: task_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.task_attachments_id_seq', 1, false);


--
-- Name: task_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.task_comments_id_seq', 3, true);


--
-- Name: task_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.task_relations_id_seq', 48, true);


--
-- Name: task_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.task_reminders_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.tasks_id_seq', 74, true);


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.team_members_id_seq', 15, true);


--
-- Name: team_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.team_projects_id_seq', 3, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.teams_id_seq', 7, true);


--
-- Name: totp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.totp_id_seq', 3, true);


--
-- Name: unsplash_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.unsplash_photos_id_seq', 1, false);


--
-- Name: user_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.user_tokens_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: users_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.users_projects_id_seq', 1, false);


--
-- Name: webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vikunja
--

SELECT pg_catalog.setval('public.webhooks_id_seq', 1, true);


--
-- Name: api_tokens api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (entity_id, user_id, kind);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: label_tasks label_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.label_tasks
    ADD CONSTRAINT label_tasks_pkey PRIMARY KEY (id);


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (id);


--
-- Name: link_shares link_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.link_shares
    ADD CONSTRAINT link_shares_pkey PRIMARY KEY (id);


--
-- Name: migration_status migration_status_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.migration_status
    ADD CONSTRAINT migration_status_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: project_views project_views_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.project_views
    ADD CONSTRAINT project_views_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: reactions reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);


--
-- Name: saved_filters saved_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.saved_filters
    ADD CONSTRAINT saved_filters_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: task_assignees task_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_assignees
    ADD CONSTRAINT task_assignees_pkey PRIMARY KEY (id);


--
-- Name: task_attachments task_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_attachments
    ADD CONSTRAINT task_attachments_pkey PRIMARY KEY (id);


--
-- Name: task_comments task_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_comments
    ADD CONSTRAINT task_comments_pkey PRIMARY KEY (id);


--
-- Name: task_relations task_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_relations
    ADD CONSTRAINT task_relations_pkey PRIMARY KEY (id);


--
-- Name: task_reminders task_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.task_reminders
    ADD CONSTRAINT task_reminders_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- Name: team_projects team_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.team_projects
    ADD CONSTRAINT team_projects_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: totp totp_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.totp
    ADD CONSTRAINT totp_pkey PRIMARY KEY (id);


--
-- Name: unsplash_photos unsplash_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.unsplash_photos
    ADD CONSTRAINT unsplash_photos_pkey PRIMARY KEY (id);


--
-- Name: user_tokens user_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.user_tokens
    ADD CONSTRAINT user_tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_projects users_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.users_projects
    ADD CONSTRAINT users_projects_pkey PRIMARY KEY (id);


--
-- Name: webhooks webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: vikunja
--

ALTER TABLE ONLY public.webhooks
    ADD CONSTRAINT webhooks_pkey PRIMARY KEY (id);


--
-- Name: IDX_api_tokens_token_last_eight; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_api_tokens_token_last_eight" ON public.api_tokens USING btree (token_last_eight);


--
-- Name: IDX_label_tasks_label_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_label_tasks_label_id" ON public.label_tasks USING btree (label_id);


--
-- Name: IDX_label_tasks_task_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_label_tasks_task_id" ON public.label_tasks USING btree (task_id);


--
-- Name: IDX_link_shares_permission; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_link_shares_permission" ON public.link_shares USING btree (permission);


--
-- Name: IDX_link_shares_shared_by_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_link_shares_shared_by_id" ON public.link_shares USING btree (shared_by_id);


--
-- Name: IDX_link_shares_sharing_type; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_link_shares_sharing_type" ON public.link_shares USING btree (sharing_type);


--
-- Name: IDX_notifications_name; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_notifications_name" ON public.notifications USING btree (name);


--
-- Name: IDX_project_views_default_bucket_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_project_views_default_bucket_id" ON public.project_views USING btree (default_bucket_id);


--
-- Name: IDX_project_views_done_bucket_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_project_views_done_bucket_id" ON public.project_views USING btree (done_bucket_id);


--
-- Name: IDX_project_views_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_project_views_project_id" ON public.project_views USING btree (project_id);


--
-- Name: IDX_projects_owner_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_projects_owner_id" ON public.projects USING btree (owner_id);


--
-- Name: IDX_projects_parent_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_projects_parent_project_id" ON public.projects USING btree (parent_project_id);


--
-- Name: IDX_reactions_entity_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_reactions_entity_id" ON public.reactions USING btree (entity_id);


--
-- Name: IDX_reactions_entity_kind; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_reactions_entity_kind" ON public.reactions USING btree (entity_kind);


--
-- Name: IDX_reactions_user_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_reactions_user_id" ON public.reactions USING btree (user_id);


--
-- Name: IDX_reactions_value; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_reactions_value" ON public.reactions USING btree (value);


--
-- Name: IDX_saved_filters_owner_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_saved_filters_owner_id" ON public.saved_filters USING btree (owner_id);


--
-- Name: IDX_subscriptions_entity_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_subscriptions_entity_id" ON public.subscriptions USING btree (entity_id);


--
-- Name: IDX_subscriptions_entity_type; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_subscriptions_entity_type" ON public.subscriptions USING btree (entity_type);


--
-- Name: IDX_subscriptions_user_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_subscriptions_user_id" ON public.subscriptions USING btree (user_id);


--
-- Name: IDX_task_assignees_task_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_assignees_task_id" ON public.task_assignees USING btree (task_id);


--
-- Name: IDX_task_assignees_user_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_assignees_user_id" ON public.task_assignees USING btree (user_id);


--
-- Name: IDX_task_buckets_bucket_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_buckets_bucket_id" ON public.task_buckets USING btree (bucket_id);


--
-- Name: IDX_task_buckets_project_view_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_buckets_project_view_id" ON public.task_buckets USING btree (project_view_id);


--
-- Name: IDX_task_buckets_task_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_buckets_task_id" ON public.task_buckets USING btree (task_id);


--
-- Name: IDX_task_comments_task_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_comments_task_id" ON public.task_comments USING btree (task_id);


--
-- Name: IDX_task_positions_project_view_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_positions_project_view_id" ON public.task_positions USING btree (project_view_id);


--
-- Name: IDX_task_positions_task_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_positions_task_id" ON public.task_positions USING btree (task_id);


--
-- Name: IDX_task_reminders_reminder; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_reminders_reminder" ON public.task_reminders USING btree (reminder);


--
-- Name: IDX_task_reminders_task_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_task_reminders_task_id" ON public.task_reminders USING btree (task_id);


--
-- Name: IDX_tasks_done; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_done" ON public.tasks USING btree (done);


--
-- Name: IDX_tasks_done_at; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_done_at" ON public.tasks USING btree (done_at);


--
-- Name: IDX_tasks_due_date; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_due_date" ON public.tasks USING btree (due_date);


--
-- Name: IDX_tasks_end_date; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_end_date" ON public.tasks USING btree (end_date);


--
-- Name: IDX_tasks_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_project_id" ON public.tasks USING btree (project_id);


--
-- Name: IDX_tasks_repeat_after; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_repeat_after" ON public.tasks USING btree (repeat_after);


--
-- Name: IDX_tasks_start_date; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_tasks_start_date" ON public.tasks USING btree (start_date);


--
-- Name: IDX_team_members_team_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_team_members_team_id" ON public.team_members USING btree (team_id);


--
-- Name: IDX_team_members_user_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_team_members_user_id" ON public.team_members USING btree (user_id);


--
-- Name: IDX_team_projects_permission; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_team_projects_permission" ON public.team_projects USING btree (permission);


--
-- Name: IDX_team_projects_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_team_projects_project_id" ON public.team_projects USING btree (project_id);


--
-- Name: IDX_team_projects_team_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_team_projects_team_id" ON public.team_projects USING btree (team_id);


--
-- Name: IDX_teams_created_by_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_teams_created_by_id" ON public.teams USING btree (created_by_id);


--
-- Name: IDX_user_tokens_token; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_user_tokens_token" ON public.user_tokens USING btree (token);


--
-- Name: IDX_users_default_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_default_project_id" ON public.users USING btree (default_project_id);


--
-- Name: IDX_users_discoverable_by_email; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_discoverable_by_email" ON public.users USING btree (discoverable_by_email);


--
-- Name: IDX_users_discoverable_by_name; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_discoverable_by_name" ON public.users USING btree (discoverable_by_name);


--
-- Name: IDX_users_overdue_tasks_reminders_enabled; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_overdue_tasks_reminders_enabled" ON public.users USING btree (overdue_tasks_reminders_enabled);


--
-- Name: IDX_users_projects_permission; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_projects_permission" ON public.users_projects USING btree (permission);


--
-- Name: IDX_users_projects_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_projects_project_id" ON public.users_projects USING btree (project_id);


--
-- Name: IDX_users_projects_user_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_users_projects_user_id" ON public.users_projects USING btree (user_id);


--
-- Name: IDX_webhooks_project_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE INDEX "IDX_webhooks_project_id" ON public.webhooks USING btree (project_id);


--
-- Name: UQE_api_tokens_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_api_tokens_id" ON public.api_tokens USING btree (id);


--
-- Name: UQE_api_tokens_token_hash; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_api_tokens_token_hash" ON public.api_tokens USING btree (token_hash);


--
-- Name: UQE_buckets_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_buckets_id" ON public.buckets USING btree (id);


--
-- Name: UQE_files_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_files_id" ON public.files USING btree (id);


--
-- Name: UQE_label_tasks_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_label_tasks_id" ON public.label_tasks USING btree (id);


--
-- Name: UQE_labels_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_labels_id" ON public.labels USING btree (id);


--
-- Name: UQE_link_shares_hash; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_link_shares_hash" ON public.link_shares USING btree (hash);


--
-- Name: UQE_link_shares_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_link_shares_id" ON public.link_shares USING btree (id);


--
-- Name: UQE_migration_status_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_migration_status_id" ON public.migration_status USING btree (id);


--
-- Name: UQE_notifications_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_notifications_id" ON public.notifications USING btree (id);


--
-- Name: UQE_project_views_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_project_views_id" ON public.project_views USING btree (id);


--
-- Name: UQE_projects_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_projects_id" ON public.projects USING btree (id);


--
-- Name: UQE_reactions_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_reactions_id" ON public.reactions USING btree (id);


--
-- Name: UQE_saved_filters_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_saved_filters_id" ON public.saved_filters USING btree (id);


--
-- Name: UQE_subscriptions_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_subscriptions_id" ON public.subscriptions USING btree (id);


--
-- Name: UQE_task_assignees_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_assignees_id" ON public.task_assignees USING btree (id);


--
-- Name: UQE_task_attachments_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_attachments_id" ON public.task_attachments USING btree (id);


--
-- Name: UQE_task_buckets_task_view; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_buckets_task_view" ON public.task_buckets USING btree (task_id, project_view_id);


--
-- Name: UQE_task_comments_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_comments_id" ON public.task_comments USING btree (id);


--
-- Name: UQE_task_relations_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_relations_id" ON public.task_relations USING btree (id);


--
-- Name: UQE_task_reminders_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_reminders_id" ON public.task_reminders USING btree (id);


--
-- Name: UQE_task_unread_statuses_task_user; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_task_unread_statuses_task_user" ON public.task_unread_statuses USING btree (task_id, user_id);


--
-- Name: UQE_tasks_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_tasks_id" ON public.tasks USING btree (id);


--
-- Name: UQE_team_members_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_team_members_id" ON public.team_members USING btree (id);


--
-- Name: UQE_team_projects_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_team_projects_id" ON public.team_projects USING btree (id);


--
-- Name: UQE_teams_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_teams_id" ON public.teams USING btree (id);


--
-- Name: UQE_totp_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_totp_id" ON public.totp USING btree (id);


--
-- Name: UQE_unsplash_photos_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_unsplash_photos_id" ON public.unsplash_photos USING btree (id);


--
-- Name: UQE_user_tokens_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_user_tokens_id" ON public.user_tokens USING btree (id);


--
-- Name: UQE_users_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_users_id" ON public.users USING btree (id);


--
-- Name: UQE_users_projects_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_users_projects_id" ON public.users_projects USING btree (id);


--
-- Name: UQE_users_username; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_users_username" ON public.users USING btree (username);


--
-- Name: UQE_webhooks_id; Type: INDEX; Schema: public; Owner: vikunja
--

CREATE UNIQUE INDEX "UQE_webhooks_id" ON public.webhooks USING btree (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO vikunja;


--
-- PostgreSQL database dump complete
--

\unrestrict WVjPAQvcf1xeWy860qpFVAw4KC5nPc7RYzhwYrtIcxxaO2TG6ocElyiuMxYsZPc

